use utf8;
package Petty::Schema::Result::SaleByFilmCategory;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Petty::Schema::Result::SaleByFilmCategory

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<sales_by_film_category>

=cut

__PACKAGE__->table("sales_by_film_category");
__PACKAGE__->result_source_instance->view_definition(" SELECT c.name AS category,\n    sum(p.amount) AS total_sales\n   FROM (((((payment p\n     JOIN rental r ON ((p.rental_id = r.rental_id)))\n     JOIN inventory i ON ((r.inventory_id = i.inventory_id)))\n     JOIN film f ON ((i.film_id = f.film_id)))\n     JOIN film_category fc ON ((f.film_id = fc.film_id)))\n     JOIN category c ON ((fc.category_id = c.category_id)))\n  GROUP BY c.name\n  ORDER BY sum(p.amount) DESC");

=head1 ACCESSORS

=head2 category

  data_type: 'varchar'
  is_nullable: 1
  size: 25

=head2 total_sales

  data_type: 'numeric'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "category",
  { data_type => "varchar", is_nullable => 1, size => 25 },
  "total_sales",
  { data_type => "numeric", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-02-21 22:30:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OHpJ7r/SJW0QVQ2DggiR6w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
