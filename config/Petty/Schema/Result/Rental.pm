use utf8;
package Petty::Schema::Result::Rental;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Petty::Schema::Result::Rental

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<rental>

=cut

__PACKAGE__->table("rental");

=head1 ACCESSORS

=head2 rental_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'rental_rental_id_seq'

=head2 rental_date

  data_type: 'timestamp'
  is_nullable: 0

=head2 inventory_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 customer_id

  data_type: 'smallint'
  is_foreign_key: 1
  is_nullable: 0

=head2 return_date

  data_type: 'timestamp'
  is_nullable: 1

=head2 staff_id

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
  "rental_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "rental_rental_id_seq",
  },
  "rental_date",
  { data_type => "timestamp", is_nullable => 0 },
  "inventory_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "customer_id",
  { data_type => "smallint", is_foreign_key => 1, is_nullable => 0 },
  "return_date",
  { data_type => "timestamp", is_nullable => 1 },
  "staff_id",
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

=item * L</rental_id>

=back

=cut

__PACKAGE__->set_primary_key("rental_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<idx_unq_rental_rental_date_inventory_id_customer_id>

=over 4

=item * L</rental_date>

=item * L</inventory_id>

=item * L</customer_id>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "idx_unq_rental_rental_date_inventory_id_customer_id",
  ["rental_date", "inventory_id", "customer_id"],
);

=head1 RELATIONS

=head2 customer

Type: belongs_to

Related object: L<Petty::Schema::Result::Customer>

=cut

__PACKAGE__->belongs_to(
  "customer",
  "Petty::Schema::Result::Customer",
  { customer_id => "customer_id" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 inventory

Type: belongs_to

Related object: L<Petty::Schema::Result::Inventory>

=cut

__PACKAGE__->belongs_to(
  "inventory",
  "Petty::Schema::Result::Inventory",
  { inventory_id => "inventory_id" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 payment_p2007_01s

Type: has_many

Related object: L<Petty::Schema::Result::PaymentP200701>

=cut

__PACKAGE__->has_many(
  "payment_p2007_01s",
  "Petty::Schema::Result::PaymentP200701",
  { "foreign.rental_id" => "self.rental_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 payment_p2007_02s

Type: has_many

Related object: L<Petty::Schema::Result::PaymentP200702>

=cut

__PACKAGE__->has_many(
  "payment_p2007_02s",
  "Petty::Schema::Result::PaymentP200702",
  { "foreign.rental_id" => "self.rental_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 payment_p2007_03s

Type: has_many

Related object: L<Petty::Schema::Result::PaymentP200703>

=cut

__PACKAGE__->has_many(
  "payment_p2007_03s",
  "Petty::Schema::Result::PaymentP200703",
  { "foreign.rental_id" => "self.rental_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 payment_p2007_04s

Type: has_many

Related object: L<Petty::Schema::Result::PaymentP200704>

=cut

__PACKAGE__->has_many(
  "payment_p2007_04s",
  "Petty::Schema::Result::PaymentP200704",
  { "foreign.rental_id" => "self.rental_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 payment_p2007_05s

Type: has_many

Related object: L<Petty::Schema::Result::PaymentP200705>

=cut

__PACKAGE__->has_many(
  "payment_p2007_05s",
  "Petty::Schema::Result::PaymentP200705",
  { "foreign.rental_id" => "self.rental_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 payment_p2007_06s

Type: has_many

Related object: L<Petty::Schema::Result::PaymentP200706>

=cut

__PACKAGE__->has_many(
  "payment_p2007_06s",
  "Petty::Schema::Result::PaymentP200706",
  { "foreign.rental_id" => "self.rental_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 payments

Type: has_many

Related object: L<Petty::Schema::Result::Payment>

=cut

__PACKAGE__->has_many(
  "payments",
  "Petty::Schema::Result::Payment",
  { "foreign.rental_id" => "self.rental_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 staff

Type: belongs_to

Related object: L<Petty::Schema::Result::Staff>

=cut

__PACKAGE__->belongs_to(
  "staff",
  "Petty::Schema::Result::Staff",
  { staff_id => "staff_id" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-02-21 22:30:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:NDzPHhJH/6/4PG3BSksffw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
