#!/usr/bin/env perl

use Mojo::Base -base;
use Mojolicious::Lite;
use Mojo::Pg;
#use Mojo::JSON qw/decode_json encode_json/;
use lib '/home/will/Perl/petty/lib';
use Petty::Model::Users;
use Petty::Schema;
use Data::Dumper;

# Documentation browser under "/perldoc"
plugin 'PODRenderer';

helper db => sub {
    state $db = Mojo::Pg->new('postgresql://will:364462@192.168.1.185:5432/yancy');
    return $db;
};

app->db->auto_migrate(1)->migrations->from_data();

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

@@ pages.html.ep
% layout 'default';
%== $item->{html}

@@ migrations
-- 1 up
CREATE TABLE IF NOT EXISTS pages (
    id SERIAL PRIMARY KEY,
    path VARCHAR(250) UNIQUE NOT NULL,
    markdown TEXT,
    html TEXT
);