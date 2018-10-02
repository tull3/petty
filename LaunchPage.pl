#!/usr/bin/env perl
use Mojolicious::Lite;
use LaunchApp::Model::Users;
use IO::File;

# Documentation browser under "/perldoc"
plugin 'PODRenderer';

my $userModel = LaunchApp::Model::Users->new();
$userModel->print_dumper();

get '/' => sub {
  my $c = shift;
  $c->render(template => 'index');
};

app->start;

__END__
__DATA__

@@ index.html.ep
% layout 'default';
% title 'Welcome';
<h1>Welcome to the Mojolicious real-time web framework!</h1>
To learn more, you can browse through the documentation
<%= link_to 'here' => '/perldoc' %>.

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
