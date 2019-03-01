use utf8;
package Petty::Schema::Result::Store;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Petty::Schema::Result::Store

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<store>

=cut

__PACKAGE__->table("store");

=head1 ACCESSORS

=head2 store_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'store_store_id_seq'

=head2 manager_staff_id

  data_type: 'smallint'
  is_foreign_key: 1
  is_nullable: 0

=head2 address_id

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
  "store_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "store_store_id_seq",
  },
  "manager_staff_id",
  { data_type => "smallint", is_foreign_key => 1, is_nullable => 0 },
  "address_id",
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

=item * L</store_id>

=back

=cut

__PACKAGE__->set_primary_key("store_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<idx_unq_manager_staff_id>

=over 4

=item * L</manager_staff_id>

=back

=cut

__PACKAGE__->add_unique_constraint("idx_unq_manager_staff_id", ["manager_staff_id"]);

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

=head2 customers

Type: has_many

Related object: L<Petty::Schema::Result::Customer>

=cut

__PACKAGE__->has_many(
  "customers",
  "Petty::Schema::Result::Customer",
  { "foreign.store_id" => "self.store_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 inventories

Type: has_many

Related object: L<Petty::Schema::Result::Inventory>

=cut

__PACKAGE__->has_many(
  "inventories",
  "Petty::Schema::Result::Inventory",
  { "foreign.store_id" => "self.store_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 manager_staff

Type: belongs_to

Related object: L<Petty::Schema::Result::Staff>

=cut

__PACKAGE__->belongs_to(
  "manager_staff",
  "Petty::Schema::Result::Staff",
  { staff_id => "manager_staff_id" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 staffs

Type: has_many

Related object: L<Petty::Schema::Result::Staff>

=cut

__PACKAGE__->has_many(
  "staffs",
  "Petty::Schema::Result::Staff",
  { "foreign.store_id" => "self.store_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-02-21 22:30:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:I0bohl2Mtpu6EoHghQocOA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
