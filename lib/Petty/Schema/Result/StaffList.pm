use utf8;
package Petty::Schema::Result::StaffList;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Petty::Schema::Result::StaffList

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<staff_list>

=cut

__PACKAGE__->table("staff_list");
__PACKAGE__->result_source_instance->view_definition(" SELECT s.staff_id AS id,\n    (((s.first_name)::text || ' '::text) || (s.last_name)::text) AS name,\n    a.address,\n    a.postal_code AS \"zip code\",\n    a.phone,\n    city.city,\n    country.country,\n    s.store_id AS sid\n   FROM (((staff s\n     JOIN address a ON ((s.address_id = a.address_id)))\n     JOIN city ON ((a.city_id = city.city_id)))\n     JOIN country ON ((city.country_id = country.country_id)))");

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
  "sid",
  { data_type => "smallint", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-02-21 22:30:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:0TWD6ZmrUNW96HQdVD8T8g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
