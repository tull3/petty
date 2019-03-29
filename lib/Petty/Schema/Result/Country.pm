use utf8;
package Petty::Schema::Result::Country;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Petty::Schema::Result::Country

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<country>

=cut

__PACKAGE__->table("country");

=head1 ACCESSORS

=head2 country_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'country_country_id_seq'

=head2 country

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 last_update

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "country_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "country_country_id_seq",
  },
  "country",
  { data_type => "varchar", is_nullable => 0, size => 50 },
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

=item * L</country_id>

=back

=cut

__PACKAGE__->set_primary_key("country_id");

=head1 RELATIONS

=head2 cities

Type: has_many

Related object: L<Petty::Schema::Result::City>

=cut

__PACKAGE__->has_many(
  "cities",
  "Petty::Schema::Result::City",
  { "foreign.country_id" => "self.country_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-02-21 22:30:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4/AC2zBKJm2qLtL/ynoNlw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
