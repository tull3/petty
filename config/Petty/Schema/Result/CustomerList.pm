use utf8;
package Petty::Schema::Result::CustomerList;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Petty::Schema::Result::CustomerList

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<customer_list>

=cut

__PACKAGE__->table("customer_list");
__PACKAGE__->result_source_instance->view_definition(" SELECT cu.customer_id AS id,\n    (((cu.first_name)::text || ' '::text) || (cu.last_name)::text) AS name,\n    a.address,\n    a.postal_code AS \"zip code\",\n    a.phone,\n    city.city,\n    country.country,\n        CASE\n            WHEN cu.activebool THEN 'active'::text\n            ELSE ''::text\n        END AS notes,\n    cu.store_id AS sid\n   FROM (((customer cu\n     JOIN address a ON ((cu.address_id = a.address_id)))\n     JOIN city ON ((a.city_id = city.city_id)))\n     JOIN country ON ((city.country_id = country.country_id)))");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_nullable: 1

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 address

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 zip code

  accessor: 'zip_code'
  data_type: 'varchar'
  is_nullable: 1
  size: 10

=head2 phone

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 city

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 country

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 notes

  data_type: 'text'
  is_nullable: 1

=head2 sid

  data_type: 'smallint'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 1 },
  "name",
  { data_type => "text", is_nullable => 1 },
  "address",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "zip code",
  {
    accessor => "zip_code",
    data_type => "varchar",
    is_nullable => 1,
    size => 10,
  },
  "phone",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "city",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "country",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "notes",
  { data_type => "text", is_nullable => 1 },
  "sid",
  { data_type => "smallint", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-02-21 22:30:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:J6F1ZcB4XfYksR/xFfHLWQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
