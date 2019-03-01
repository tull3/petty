use utf8;
package Petty::Schema::Result::City;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Petty::Schema::Result::City

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<city>

=cut

__PACKAGE__->table("city");

=head1 ACCESSORS

=head2 city_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'city_city_id_seq'

=head2 city

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 country_id

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
  "city_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "city_city_id_seq",
  },
  "city",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "country_id",
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

=item * L</city_id>

=back

=cut

__PACKAGE__->set_primary_key("city_id");

=head1 RELATIONS

=head2 addresses

Type: has_many

Related object: L<Petty::Schema::Result::Address>

=cut

__PACKAGE__->has_many(
  "addresses",
  "Petty::Schema::Result::Address",
  { "foreign.city_id" => "self.city_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 country

Type: belongs_to

Related object: L<Petty::Schema::Result::Country>

=cut

__PACKAGE__->belongs_to(
  "country",
  "Petty::Schema::Result::Country",
  { country_id => "country_id" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-02-21 22:30:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tyL3Xm6mMG8xSlSoflKK4Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
