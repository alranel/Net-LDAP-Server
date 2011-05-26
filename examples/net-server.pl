#!/usr/bin/perl

use strict;
use warnings;

package Listener;
use Net::Server;
use base 'Net::Server::Fork';
use MyDemoServer;
#use Data::Dumper;
#use Scalar::Util qw/openhandle/;

sub process_request {
	my $self = shift;
	
    my $in = *STDIN{IO};
    my $out = *STDOUT{IO};

    my $sock = $self->{server}->{client};
	#print STDERR "Accepted connection from: %s\n", Dumper($sock->connected() );
	#printf STDERR "Accepted connection from: %s\n", join '.', unpack( 'C4', $sock->connected() );

    #print STDERR 'in = ('.openhandle($in).') '.Dumper($in);
    #print STDERR 'out = ('.openhandle($out).') '.Dumper($out);
	my $handler = MyDemoServer->new($sock);
	#my $handler = MyDemoServer->new($in,$out);
	while (1) {
		my $finished = $handler->handle;
        return if $finished;
	}
}

package main;
Listener->run(port => 8080);

1;
