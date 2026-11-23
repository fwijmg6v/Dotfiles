#!/usr/bin/env perl
# Rebuild the [icon] section of theme.toml from yazi's stock theme-dark.toml, mapping
# every icon colour to the ice palette by hue (greys by lightness).
#   perl recolor-icons.pl theme-dark.toml > icons.toml   # then replace [icon] in theme.toml
# theme-dark.toml: https://github.com/sxyazi/yazi/blob/<tag>/yazi-config/preset/theme-dark.toml
use strict;
use warnings;
use List::Util qw(max min);

# [upper hue bound, colour]; first bucket whose bound exceeds the hue wins
my @hues = (
	[15,  '#FF6B7E'],  # red      (ghostty 1)
	[40,  '#F0A57B'],  # orange   (added, ice-softened)
	[70,  '#E5C07B'],  # yellow   (ghostty 3)
	[165, '#98C379'],  # green    (ghostty 2)
	[185, '#BCE3FF'],  # cyan     (accent, ghostty 6)
	[250, '#8CC8FF'],  # blue     (added, ice-softened)
	[300, '#C678DD'],  # purple   (ghostty 5)
	[340, '#D688ED'],  # pink     (ghostty 13)
	[361, '#FF6B7E'],  # red again
);

sub ice {
	my ($r, $g, $b) = map { hex($_) / 255 } unpack '(A2)3', shift;
	my ($max, $min) = (max($r, $g, $b), min($r, $g, $b));
	my ($l, $d) = (($max + $min) / 2, $max - $min);
	my $s = $d == 0 ? 0 : $d / (1 - abs(2 * $l - 1));
	if ($s < 0.25 || $d < 0.12) {    # greys and near-greys
		return $l > 0.75 ? '#E6F0FA' : $l > 0.45 ? '#8DA0B0' : '#7D8B99';
	}
	my $h = $max == $r ? 60 * (($g - $b) / $d)
	      : $max == $g ? 60 * (($b - $r) / $d + 2)
	      :              60 * (($r - $g) / $d + 4);
	$h += 360 if $h < 0;
	$_->[0] > $h and return $_->[1] for @hues;
}

my $in = 0;
while (<>) {
	$in ||= /^\[icon\]/;
	next unless $in;
	next if /^# (vim|: )/;
	s/fg = "#([0-9a-fA-F]{6})"/'fg = "' . ice($1) . '"'/ge;
	print;
}
