package Petty::Model::Users;

use Mojo::Util qw(secure_compare);
use Mojo::JSON qw(decode_json);
use Mojo::File qw(path);
use Data::Dumper;
use Mojo::Base -base;

my $users;

sub new {
    my $self = shift;
    my $configFile = path('< config/users.json');
    my $jsonString = $configFile->slurp;
    my $configValues = decode_json($jsonString);
    bless { user => $configValues->{user},
        passwd => $configValues->{passwd} }, $self;
}

sub print_dumper {
    my $self = shift;
    print Dumper($self);
}

1;