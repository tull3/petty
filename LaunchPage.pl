#!/usr/bin/env perl

use Mojo::Base -base;
use Mojolicious::Lite;
use Mojo::Pg;
#use Mojo::JSON qw/decode_json encode_json/;
use Mojo::File qw/path/;
use lib path(__FILE__)->dirname() . '/lib';
use Petty::Model::Users;
use Petty::Schema;
use Data::Dumper;
use Data::UUID;

# Documentation browser under "/perldoc"
# plugin 'PODRenderer';

helper uuidGen => sub {
    state $ug = Data::UUID->new();
    return $ug;
};

app->secrets([app->uuidGen->create()]);

helper db => sub {
    state $db = Mojo::Pg->new('postgresql://will:364462@192.168.1.185:5432/yancy');
    return $db;
};

# app->db->auto_migrate(1)->migrations->from_data();

plugin 'Yancy', {
    backend => { Pg => app->db },
    read_schema => 1,
    collections => {
        pages => {
            'x-id-field' => 'path',
            'x-list-columns' => [qw( path )],
            'x-view-item-url' => '/{path}',
            properties => {
                id => {
                    readOnly => 1,
                },
                markdown => {
                    format => 'markdown',
                    'x-html-field' => 'html',
                },
            },
        },
    },
};

any '/login' => sub {
    my $c = shift;

    # Query or POST parameters
    my $user = $c->param('user') || '';
    my $pass = $c->param('pass') || '';

    my $userObj = Petty::Model::Users->new({ userName => $user, password => $pass });

    # Check password and render "index.html.ep" if necessary
    return $c->render unless $userObj->authenticate();

    # Store username in session
    $c->session(user => $userObj->userName());

    # Store a friendly message for the next page in flash
    $c->flash(message => 'Thanks for logging in.');

    # Redirect to protected page with a 302 response
    $c->redirect_to('protected');
} => 'index';

# Make sure user is logged in for actions in this group
group {
    under sub {
        my $c = shift;

        # Redirect to main page with a 302 response if user is not logged in
        return 1 if $c->session('user');
        $c->redirect_to('index');
        return undef;
    };

    # A protected page auto rendering "protected.html.ep"
    get '/protected';
};

get '/logout' => sub {
    my $c = shift;

    # Expire and in turn clear session automatically
    $c->session(expires => 1);

    # Redirect to main page with a 302 response
    $c->redirect_to('index');
};

get '/yanciness/*id' => {
    id => 'index', # Default to index page
    controller => 'yancy',
    action => 'get',
    collection => 'pages',
    template => 'pages',
};

 get '/testing' => sub {
     my $c = shift;
     my $schema1 = Petty::Schema->connect(
         'dbi:Pg:database=pagila;host=192.168.1.185;port=5432',
         'postgres',
         '364462',
         { AutoCommit => 1 },
     );
     my @results = $schema1->resultset('Actor')->search(
         {actor_id => [qw/1 2 3 4 5 6 7 8 9/]},
         {columns => [qw/first_name last_name/]}
     );
#     say Dumper(\@resultSet);
#     $c->stash(frameworks => $frameworks);
     my @response;
     foreach my $result (@results) {
         push @response, {$result->get_columns};
     }
     $c->render(json => \@response);
};

app->start;

__DATA__

@@ index.html.ep
% layout 'default';
%= form_for index => begin
  % if (param 'user') {
    <b>Wrong name or password, please try again.</b><br>
  % }
  Name:<br>
  %= text_field 'user'
  <br>Password:<br>
  %= password_field 'pass'
  <br>
  %= submit_button 'Login'
% end

@@ protected.html.ep
% layout 'default';
% if (my $msg = flash 'message') {
  <b><%= $msg %></b><br>
% }
Welcome <%= session 'user' %>.<br>
%= link_to Logout => 'logout'

@@ migrations
-- 1 up
CREATE TABLE IF NOT EXISTS pages (
    id SERIAL PRIMARY KEY,
    path VARCHAR(250) UNIQUE NOT NULL,
    markdown TEXT,
    html TEXT
);