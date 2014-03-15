#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use 5.014;
use Net::DNS::Nameserver;
use Net::DNS::RR;
 
my $handler = sub {
    my ($qname, $qclass, $qtype, @opt) = @_;
    my ($rcode, @ans, @auth, @add);
    my $ttl = 777;
    $rcode = "NOERROR";
    @ans = (
        Net::DNS::RR->new("$qname $ttl $qclass $qtype 'Hello World!'")
    );
    return ($rcode, \@ans, \@auth, \@add, { aa => 1 });
};
 
my $ns = Net::DNS::Nameserver->new(
    LocalAddr => '0.0.0.0',
    LocalPort => '5053',
    ReplyHandler => $handler,
    Verbose => 1,
);
 
$ns->main_loop;
