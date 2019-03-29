use utf8;
package Petty::Schema::Result::Language;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Petty::Schema::Result::Language

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<language>

=cut

__PACKAGE__->table("language");

=head1 ACCESSORS

=head2 language_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'language_language_id_seq'

=head2 name

  data_type: 'char'
  is_nullable: 0
  size: 20

=head2 last_update

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "language_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "language_language_id_seq",
  },
  "name",
  { data_type => "char", is_nullable => 0, size => 20 },
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

=item * L</language_id>

=back

=cut

__PACKAGE__->set_primary_key("language_id");

=head1 RELATIONS

=head2 film_languages

Type: has_many

Related object: L<Petty::Schema::Result::Film>

=cut

__PACKAGE__->has_many(
  "film_languages",
  "Petty::Schema::Result::Film",
  { "foreign.language_id" => "self.language_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 film_original_languages

Type: has_many

Related object: L<Petty::Schema::Result::Film>

=cut

__PACKAGE__->has_many(
  "film_original_languages",
  "Petty::Schema::Result::Film",
  { "foreign.original_language_id" => "self.language_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-02-21 22:30:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6dQgjPFgJt9UrC9pRjYOKw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
