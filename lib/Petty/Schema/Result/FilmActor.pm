use utf8;
package Petty::Schema::Result::FilmActor;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Petty::Schema::Result::FilmActor

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<film_actor>

=cut

__PACKAGE__->table("film_actor");

=head1 ACCESSORS

=head2 actor_id

  data_type: 'smallint'
  is_foreign_key: 1
  is_nullable: 0

=head2 film_id

  data_type: 'smallint'
  is_foreign_key: 1
  is_nullable: 0

=head2 last_update

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "actor_id",
  { data_type => "smallint", is_foreign_key => 1, is_nullable => 0 },
  "film_id",
  { data_type => "smallint", is_foreign_key => 1, is_nullable => 0 },
  "last_update",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</actor_id>

=item * L</film_id>

=back

=cut

__PACKAGE__->set_primary_key("actor_id", "film_id");

=head1 RELATIONS

=head2 actor

Type: belongs_to

Related object: L<Petty::Schema::Result::Actor>

=cut

__PACKAGE__->belongs_to(
  "actor",
  "Petty::Schema::Result::Actor",
  { actor_id => "actor_id" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 film

Type: belongs_to

Related object: L<Petty::Schema::Result::Film>

=cut

__PACKAGE__->belongs_to(
  "film",
  "Petty::Schema::Result::Film",
  { film_id => "film_id" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-02-21 22:30:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:XsMsLUK/tmJBN6eAYBJVag


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
