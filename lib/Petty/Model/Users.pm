package Petty::Model::Users;

use Mojo::Util qw(secure_compare);
use Mojo::JSON qw(decode_json);
use Mojo::File qw(path);
use Data::Dumper;
use Moose;
use Function::Parameters;
use namespace::autoclean;

# use constant USER_FILE = path(__FILE__)->dirname() . '/../../../config/users.json';

has 'userName' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1
);

has 'password' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1
);

sub authenticate {
    my $self = shift;
    my $userFile = path(path(__FILE__)->dirname() . '/../../../config/users.json');
    my $users = decode_json($userFile->slurp());
    return 0 unless ($self->userName() && $self->password());
    return 1 if secure_compare($users->{$self->userName()}->{password}, $self->password());
    return 0;
}

__PACKAGE__->meta->make_immutable;

return 1;