use utf8;
package Petty::Schema::Result::PaymentP200701;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Petty::Schema::Result::PaymentP200701

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<payment_p2007_01>

=cut

__PACKAGE__->table("payment_p2007_01");

=head1 ACCESSORS

=head2 payment_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'payment_payment_id_seq'

=head2 customer_id

  data_type: 'smallint'
  is_foreign_key: 1
  is_nullable: 0

=head2 staff_id

  data_type: 'smallint'
  is_foreign_key: 1
  is_nullable: 0

=head2 rental_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 amount

  data_type: 'numeric'
  is_nullable: 0
  size: [5,2]

=head2 payment_date

  data_type: 'timestamp'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "payment_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "payment_payment_id_seq",
  },
  "customer_id",
  { data_type => "smallint", is_foreign_key => 1, is_nullable => 0 },
  "staff_id",
  { data_type => "smallint", is_foreign_key => 1, is_nullable => 0 },
  "rental_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "amount",
  { data_type => "numeric", is_nullable => 0, size => [5, 2] },
  "payment_date",
  { data_type => "timestamp", is_nullable => 0 },
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
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 rental

Type: belongs_to

Related object: L<Petty::Schema::Result::Rental>

=cut

__PACKAGE__->belongs_to(
  "rental",
  "Petty::Schema::Result::Rental",
  { rental_id => "rental_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 staff

Type: belongs_to

Related object: L<Petty::Schema::Result::Staff>

=cut

__PACKAGE__->belongs_to(
  "staff",
  "Petty::Schema::Result::Staff",
  { staff_id => "staff_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-02-21 22:30:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7doAUaekzH82DGRrRn7KtQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
