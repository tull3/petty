package Petty::Controller::Root;

use Mojo::Base 'Mojolicious::Controller';
use Mojo::File qw/path/;
use lib path(__FILE__)->dirname() . '/../../../lib';

sub index {

}

1;