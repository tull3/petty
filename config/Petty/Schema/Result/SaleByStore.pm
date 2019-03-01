use utf8;
package Petty::Schema::Result::SaleByStore;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Petty::Schema::Result::SaleByStore

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<sales_by_store>

=cut

__PACKAGE__->table("sales_by_store");
__PACKAGE__->result_source_instance->view_definition(" SELECT (((c.city)::text || ','::text) || (cy.country)::text) AS store,\n    (((m.first_name)::text || ' '::text) || (m.last_name)::text) AS manager,\n    sum(p.amount) AS total_sales\n   FROM (((((((payment p\n     JOIN rental r ON ((p.rental_id = r.rental_id)))\n     JOIN inventory i ON ((r.inventory_id = i.inventory_id)))\n     JOIN store s ON ((i.store_id = s.store_id)))\n     JOIN address a ON ((s.address_id = a.address_id)))\n     JOIN city c ON ((a.city_id = c.city_id)))\n     JOIN country cy ON ((c.country_id = cy.country_id)))\n     JOIN staff m ON ((s.manager_staff_id = m.staff_id)))\n  GROUP BY cy.country, c.city, s.store_id, m.first_name, m.last_name\n  ORDER BY cy.country, c.city");

=head1 ACCESSORS

=head2 store

  data_type: 'text'
  is_nullable: 1

=head2 manager

  data_type: 'text'
  is_nullable: 1

=head2 total_sales

  data_type: 'numeric'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "store",
  { data_type => "text", is_nullable => 1 },
  "manager",
  { data_type => "text", is_nullable => 1 },
  "total_sales",
  { data_type => "numeric", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-02-21 22:30:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jU5IXiK6uoG5CwxsF8AyyQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
