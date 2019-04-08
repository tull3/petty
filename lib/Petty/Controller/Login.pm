package Petty::Controller::Login;

use Mojo::Base 'Mojolicious::Controller';
use Mojo::File qw/path/;
use lib path(__FILE__)->dirname() . '/../../../lib';
use Petty::Model::Users;
use Mojo::Util qw/dumper/;

sub index {
    my $self = shift;

    # Query or POST parameters
    my $user = $self->param('user') || '';
    my $pass = $self->param('pass') || '';

    my $userObj = Petty::Model::Users->new({ userName => $user, password => $pass });

    # Check password and render "index.html.ep" if necessary
    return $self->render unless $userObj->authenticate();

    # Store username in session
    $self->session(user => $userObj->userName());

    say dumper $self->session();

    # Store a friendly message for the next page in flash
    $self->flash(message => 'Thanks for logging in.');

    # Redirect to protected page with a 302 response
    $self->redirect_to('protected');
}

sub logged_in {
    my $self = shift;

    # Redirect to main page with a 302 response if user is not logged in
    return 1 if $self->session('user');
    $self->redirect_to('index');
    return undef;
}

sub logout {
    my $self = shift;

    # Expire and in turn clear session automatically
    $self->session(expires => 1);

    # Redirect to main page with a 302 response
    $self->redirect_to('index');
}

1;