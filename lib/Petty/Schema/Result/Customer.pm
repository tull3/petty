use utf8;
package Petty::Schema::Result::Customer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Petty::Schema::Result::Customer

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<customer>

=cut

__PACKAGE__->table("customer");

=head1 ACCESSORS

=head2 customer_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'customer_customer_id_seq'

=head2 store_id

  data_type: 'smallint'
  is_foreign_key: 1
  is_nullable: 0

=head2 first_name

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 last_name

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 email

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 address_id

  data_type: 'smallint'
  is_foreign_key: 1
  is_nullable: 0

=head2 activebool

  data_type: 'boolean'
  default_value: true
  is_nullable: 0

=head2 create_date

  data_type: 'date'
  default_value: ('now'::text)::date
  is_nullable: 0

=head2 last_update

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 1
  original: {default_value => \"now()"}

=head2 active

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "customer_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "customer_customer_id_seq",
  },
  "store_id",
  { data_type => "smallint", is_foreign_key => 1, is_nullable => 0 },
  "first_name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "last_name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "email",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "address_id",
  { data_type => "smallint", is_foreign_key => 1, is_nullable => 0 },
  "activebool",
  { data_type => "boolean", default_value => \"true", is_nullable => 0 },
  "create_date",
  {
    data_type     => "date",
    default_value => \"('now'::text)::date",
    is_nullable   => 0,
  },
  "last_update",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 1,
    original      => { default_value => \"now()" },
  },
  "active",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</customer_id>

=back

=cut

__PACKAGE__->set_primary_key("customer_id");

=head1 RELATIONS

=head2 address

Type: belongs_to

Related object: L<Petty::Schema::Result::Address>

=cut

__PACKAGE__->belongs_to(
  "address",
  "Petty::Schema::Result::Address",
  { address_id => "address_id" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 payment_p2007_01s

Type: has_many

Related object: L<Petty::Schema::Result::PaymentP200701>

=cut

__PACKAGE__->has_many(
  "payment_p2007_01s",
  "Petty::Schema::Result::PaymentP200701",
  { "foreign.customer_id" => "self.customer_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 payment_p2007_02s

Type: has_many

Related object: L<Petty::Schema::Result::PaymentP200702>

=cut

__PACKAGE__->has_many(
  "payment_p2007_02s",
  "Petty::Schema::Result::PaymentP200702",
  { "foreign.customer_id" => "self.customer_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 payment_p2007_03s

Type: has_many

Related object: L<Petty::Schema::Result::PaymentP200703>

=cut

__PACKAGE__->has_many(
  "payment_p2007_03s",
  "Petty::Schema::Result::PaymentP200703",
  { "foreign.customer_id" => "self.customer_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 payment_p2007_04s

Type: has_many

Related object: L<Petty::Schema::Result::PaymentP200704>

=cut

__PACKAGE__->has_many(
  "payment_p2007_04s",
  "Petty::Schema::Result::PaymentP200704",
  { "foreign.customer_id" => "self.customer_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 payment_p2007_05s

Type: has_many

Related object: L<Petty::Schema::Result::PaymentP200705>

=cut

__PACKAGE__->has_many(
  "payment_p2007_05s",
  "Petty::Schema::Result::PaymentP200705",
  { "foreign.customer_id" => "self.customer_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 payment_p2007_06s

Type: has_many

Related object: L<Petty::Schema::Result::PaymentP200706>

=cut

__PACKAGE__->has_many(
  "payment_p2007_06s",
  "Petty::Schema::Result::PaymentP200706",
  { "foreign.customer_id" => "self.customer_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 payments

Type: has_many

Related object: L<Petty::Schema::Result::Payment>

=cut

__PACKAGE__->has_many(
  "payments",
  "Petty::Schema::Result::Payment",
  { "foreign.customer_id" => "self.customer_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 rentals

Type: has_many

Related object: L<Petty::Schema::Result::Rental>

=cut

__PACKAGE__->has_many(
  "rentals",
  "Petty::Schema::Result::Rental",
  { "foreign.customer_id" => "self.customer_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 store

Type: belongs_to

Related object: L<Petty::Schema::Result::Store>

=cut

__PACKAGE__->belongs_to(
  "store",
  "Petty::Schema::Result::Store",
  { store_id => "store_id" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-02-21 22:30:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gBFQDgdbuz8ud3N0z8k3zg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
