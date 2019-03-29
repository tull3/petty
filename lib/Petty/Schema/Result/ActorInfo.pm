use utf8;
package Petty::Schema::Result::ActorInfo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Petty::Schema::Result::ActorInfo

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<actor_info>

=cut

__PACKAGE__->table("actor_info");
__PACKAGE__->result_source_instance->view_definition(" SELECT a.actor_id,\n    a.first_name,\n    a.last_name,\n    group_concat(DISTINCT (((c.name)::text || ': '::text) || ( SELECT group_concat((f.title)::text) AS group_concat\n           FROM ((film f\n             JOIN film_category fc_1 ON ((f.film_id = fc_1.film_id)))\n             JOIN film_actor fa_1 ON ((f.film_id = fa_1.film_id)))\n          WHERE ((fc_1.category_id = c.category_id) AND (fa_1.actor_id = a.actor_id))\n          GROUP BY fa_1.actor_id))) AS film_info\n   FROM (((actor a\n     LEFT JOIN film_actor fa ON ((a.actor_id = fa.actor_id)))\n     LEFT JOIN film_category fc ON ((fa.film_id = fc.film_id)))\n     LEFT JOIN category c ON ((fc.category_id = c.category_id)))\n  GROUP BY a.actor_id, a.first_name, a.last_name");

=head1 ACCESSORS

=head2 actor_id

  data_type: 'integer'
  is_nullable: 1

=head2 first_name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 last_name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 film_info

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "actor_id",
  { data_type => "integer", is_nullable => 1 },
  "first_name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "last_name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "film_info",
  { data_type => "text", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-02-21 22:30:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3moeBLmlGIiCyDCziKr5Hg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
