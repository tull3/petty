#!/usr/bin/env perl
package LaunchPage;

use Mojo::Base -base;
use Mojolicious::Lite;
use Mojo::Pg;
use lib 'lib';
use Petty::Model::Users;

BEGIN {
    say for *ISA;
}

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

get '/*id' => {
    id => 'index', # Default to index page
    controller => 'yancy',
    action => 'get',
    collection => 'pages',
    template => 'pages',
};

# get '/' => sub {
#  my $c = shift;
#  $c->render(template => 'index');
#};

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