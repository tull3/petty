use utf8;
package Petty::Schema::Result::Category;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Petty::Schema::Result::Category

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<category>

=cut

__PACKAGE__->table("category");

=head1 ACCESSORS

=head2 category_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'category_category_id_seq'

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 25

=head2 last_update

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "category_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "category_category_id_seq",
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 25 },
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

=item * L</category_id>

=back

=cut

__PACKAGE__->set_primary_key("category_id");

=head1 RELATIONS

=head2 film_categories

Type: has_many

Related object: L<Petty::Schema::Result::FilmCategory>

=cut

__PACKAGE__->has_many(
  "film_categories",
  "Petty::Schema::Result::FilmCategory",
  { "foreign.category_id" => "self.category_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-02-21 22:30:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fzWIq/4tvoIPPK9vEzaQkA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
