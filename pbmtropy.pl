#! /usr/bin/perl

# pbmtropy - weird pbm image generator
# Small tool with only one branch and rolling workflow. Generally procedural
# generated 2D greyscale images with stripes.
# Usage: ./pbmtropy.pl

use 5.26.1;
use strict;
use warnings;

my $lf = chr(10); # Linefeed.
my $img_type = "P1";
my $img_size = 40; # <STDIN> makes a newline.

writeToFile();

print "Bitmap ready.\n";
autoflush STDOUT 1;

sub writeToFile
{
    open(my $file, '>', "bitmap.pbm")
    or die "Couldn't open the file, stopped.";

    print $file $img_type, $lf;
    print $file $img_size, ,' ' ,$img_size, $lf, $lf;

    # Generating.
    for(my $y = 0; $y < $img_size; $y++)
    {
        my $pos = int(rand($img_size)); # Data::Entropy is generally better.
        my $width = int(rand($img_size - $pos - 1)); # Black horizontal stripe.

        for(my $x = 0; $x < $pos; $x++) # Set position of a horizontal line.
        {
            print $file '0';
        }
        for(my $sz = 0; $sz < $width; $sz++) # Print it.
        {
            print $file '1';
        }
        for(my $x = $pos; $x < $img_size - $width; $x++) # Fill the rest.
        {
            print $file '0';
        }
        print $file $lf, $lf;
    }
    close $file;
}
