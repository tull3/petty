package Petty::Model::Users;

use strict;
use warnings;

use Mojo::Util qw(secure_compare);
use Mojo::JSON qw(decode_json);
use IO::File;
use Data::Dumper;
use lib 'lib';

my $users;

sub new {
    my $self = shift;
    my $configFile = IO::File->new('< config/users.json');
    my @configLines = $configFile->getlines();
    my $jsonString = join ' ', @configLines;
    my $configValues = decode_json($jsonString);
    bless { user => $configValues->{user},
        passwd => $configValues->{passwd} }, $self;
}

sub print_dumper {
    my $self = shift;
    print Dumper($self);
}

1;