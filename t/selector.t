use strict;
use warnings;

use FindBin qw( $Bin );
use Test::More;
use Test::TCP;
use File::Temp ();
use Perlbal::Test ();

test_tcp(
    server => sub {
        my $port = shift;

        my $conf_fh = File::Temp->new;
        print $conf_fh <<"CONF";
LOAD ServerStarter
LOAD Vhosts

CREATE SERVICE frontend
  SET role    = selector
  SET plugins = Vhosts
  LISTEN = $port
  VHOST * = web
ENABLE frontend

CREATE SERVICE web
  SET role    = web_server
  SET docroot = $Bin/htdocs
ENABLE web
CONF
        exec 'start_server', '--port', $port, '--', 'perlbal', '-c', $conf_fh->filename;
    },
    client => sub {
        my $port = shift;

        subtest 'listen by selector role' => sub {
            my $ua = Perlbal::Test::ua();
            my $res = $ua->get("http://localhost:$port/");
            ok $res;
            ok $res->is_success;
            like $res->content, qr{this is index};
        };
    },
);

done_testing;
