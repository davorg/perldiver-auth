use utf8;
package PerlDiverAuth::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-09-15 12:23:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:y6R1Vkg3/gP6cbZIlORErA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

sub get_schema {
  my @errors;
  foreach (qw[PD_AUTH_DB_HOST PD_AUTH_DB_NAME PD_AUTH_DB_USER PD_AUTH_DB_PASS]) {
    push @errors, $_ unless defined $ENV{$_};
  }

  if (@errors) {
    die 'Please set the following environment variables: ',
        join(', ', @errors), "\n";
  }

  my $dsn = "dbi:mysql:host=$ENV{PD_AUTH_DB_HOST};database=$ENV{PD_AUTH_DB_NAME}";
  if ($ENV{PD_AUTH_DB_PORT}) {
    $dsn .= ";port=$ENV{PD_AUTH_DB_PORT}";
  }

  my $sch = __PACKAGE__->connect(
    $dsn, $ENV{PD_AUTH_DB_USER}, $ENV{PD_AUTH_DB_PASS},
    { mysql_enable_utf8 => 1, quote_char => '`' },
  );

  return $sch;
}

__PACKAGE__->meta->make_immutable(inline_constructor => 0);
1;
