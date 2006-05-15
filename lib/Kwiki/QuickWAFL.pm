package Kwiki::QuickWAFL;

use warnings;
use strict;
use Kwiki::Plugin '-Base';
use mixin 'Kwiki::Installer';
our $VERSION = '0.01';

const class_title => 'QuickWAFL';
const class_id => 'quickwafl';

sub register {
	my $registry = shift;
#	$registry->add( wafl => graybox => 'Kwiki::QuickWAFL::Block' );
#	$registry->add( wafl => example => 'Kwiki::QuickWAFL::Block' );
#	$registry->add( wafl => greenbox => 'Kwiki::QuickWAFL::Block' );
#	$registry->add( wafl => workaround => 'Kwiki::QuickWAFL::Block' );
	foreach( @{$self->config->blocks}) {
		$registry->add( wafl => $_ => 'Kwiki::QuickWAFL::Block' );
	}
}

package Kwiki::QuickWAFL::Block;
use base qw( Spoon::Formatter::WaflBlock );
sub contains_phrases {
	my $id = $self->formatter_id;
	[ grep {$_ ne $id} @{$self->hub->formatter->all_phrases} ];
}
sub contains_blocks {
    $self->hub->formatter->all_blocks;
}

package Kwiki::QuickWAFL;
1; # End of Kwiki::QuickWAFL
__DATA__
=head1 NAME

Kwiki::QuickWAFL - Causes configured WALF methods to have their contents
processed by the normal Kwiki formatting engine.

=head1 SYNOPSIS

Add your WAFL method to the config file. You can do this by putting the
following in config.yaml:

	blocks
	- example
	- workaround

Add as many items you want to the list. After editing the config file run:

	kwiki -update

This will inform the Kwiki engine of your new WAFL phrases.

Then do:

	.example
	Some text *here*
	.example

Change the CSS to make .example look like you want and you are done.

=head TODO

I would like to be able to do the same thing with WALF Phrases but I was unable
to get the Kwiki formatting engine to process the contents inside a WALF Phrase.

=head1 AUTHOR

Eric Anderson, C<< <eric at cordata.com> >>

=head1 COPYRIGHT & LICENSE

Copyright 2006 CorData, all rights reserved.

This program is free software; you can redistribute it and/or modify it under
the same terms as Perl itself. See http://www.perl.com/perl/misc/Artistic.html

=cut
__config/quick_walf.yaml__
blocks:
- example
- workaround
