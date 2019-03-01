use utf8;
package Petty::Schema::Result::NicerButSlowerFilmList;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Petty::Schema::Result::NicerButSlowerFilmList

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<nicer_but_slower_film_list>

=cut

__PACKAGE__->table("nicer_but_slower_film_list");
__PACKAGE__->result_source_instance->view_definition(" SELECT film.film_id AS fid,\n    film.title,\n    film.description,\n    category.name AS category,\n    film.rental_rate AS price,\n    film.length,\n    film.rating,\n    group_concat((((upper(\"substring\"((actor.first_name)::text, 1, 1)) || lower(\"substring\"((actor.first_name)::text, 2))) || upper(\"substring\"((actor.last_name)::text, 1, 1))) || lower(\"substring\"((actor.last_name)::text, 2)))) AS actors\n   FROM ((((category\n     LEFT JOIN film_category ON ((category.category_id = film_category.category_id)))\n     LEFT JOIN film ON ((film_category.film_id = film.film_id)))\n     JOIN film_actor ON ((film.film_id = film_actor.film_id)))\n     JOIN actor ON ((film_actor.actor_id = actor.actor_id)))\n  GROUP BY film.film_id, film.title, film.description, category.name, film.rental_rate, film.length, film.rating");

=head1 ACCESSORS

=head2 fid

  data_type: 'integer'
  is_nullable: 1

=head2 title

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 category

  data_type: 'varchar'
  is_nullable: 1
  size: 25

=head2 price

  data_type: 'numeric'
  is_nullable: 1
  size: [4,2]

=head2 length

  data_type: 'smallint'
  is_nullable: 1

=head2 rating

  data_type: 'enum'
  extra: {custom_type_name => "mpaa_rating",list => ["G","PG","PG-13","R","NC-17"]}
  is_nullable: 1

=head2 actors

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "fid",
  { data_type => "integer", is_nullable => 1 },
  "title",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "category",
  { data_type => "varchar", is_nullable => 1, size => 25 },
  "price",
  { data_type => "numeric", is_nullable => 1, size => [4, 2] },
  "length",
  { data_type => "smallint", is_nullable => 1 },
  "rating",
  {
    data_type => "enum",
    extra => {
      custom_type_name => "mpaa_rating",
      list => ["G", "PG", "PG-13", "R", "NC-17"],
    },
    is_nullable => 1,
  },
  "actors",
  { data_type => "text", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-02-21 22:30:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2sWbCJkI8IctxMNSago7HA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
