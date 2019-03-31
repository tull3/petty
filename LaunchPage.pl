#!/usr/bin/env perl

use Mojo::Base -base;
use Mojo::File qw/path/;
use lib path(__FILE__)->dirname() . '/lib';
use Mojolicious::Commands;

# Documentation browser under "/perldoc"
# plugin 'PODRenderer';

Mojolicious::Commands->start_app('Petty');

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