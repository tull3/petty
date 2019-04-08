package Petty;

use Mojo::Base 'Mojolicious';
use Mojo::File qw/path/;
use lib path(__FILE__)->dirname() . '/lib';
use Mojo::Pg;
use Petty::Model::Users;
use Petty::Schema;
use Data::Dumper;
use Data::UUID;

sub startup {
    my $self = shift;

    $self->helper(uuidGen => sub {
        state $ug = Data::UUID->new();
        return $ug;
    });

    $self->secrets([ $self->uuidGen->create() ]);

    $self->helper(db => sub {
        state $db = Mojo::Pg->new('postgresql://will:364462@192.168.1.185:5432/yancy');
        return $db;
    });

    $self->plugin('Yancy', {
        backend     => { Pg => $self->db },
        read_schema => 1,
        collections => {
            pages => {
                'x-id-field'      => 'path',
                'x-list-columns'  => [ qw(path) ],
                'x-view-item-url' => '/{path}',
                properties        => {
                    id       => {
                        readOnly => 1,
                    },
                    markdown => {
                        format         => 'markdown',
                        'x-html-field' => 'html',
                    },
                },
            },
        }
    });

    my $r = $self->routes();

    $r->any('/')->to('login#index')->name('index');

    my $logged_in = $r->under('/')->to('login#logged_in');

    $logged_in->get('/protected')->to('login#protected');

    $r->get('/logout')->to('login#logout');

    $r->get('/yanciness/*id' => sub {
        id => 'index', # Default to index page
        controller => 'yancy',
        action => 'get',
        collection => 'pages',
        template => 'pages'
    });

    $r->get('/testing' => sub {
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
    });

}

1;

__DATA__

@@ migrations
-- 1 up
CREATE TABLE IF NOT EXISTS pages (
    id SERIAL PRIMARY KEY,
    path VARCHAR(250) UNIQUE NOT NULL,
    markdown TEXT,
    html TEXT
);