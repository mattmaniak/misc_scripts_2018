#! /bin/bash

# Script that draws tic-tac-toe board using Unicode.

# https://en.wikipedia.org/wiki/Code_page_437
# https://en.wikipedia.org/wiki/Code_page_852
o='\u006F'                  # o
x='\u0078'                  # x
space='\u0020'

x_border='\u2500'           # -
y_border='\u2502'           # |
upper_x='\u252C'            # `
lower_x='\u2534'            # _

left_upper_corner='\u250C'  # |`
right_upper_corner='\u2510' # `|
right_lower_corner='\u2518' # _|
left_lower_corner='\u2514'  # |_

left_y='\u251C'             # |-
right_y='\u2524'            # -|
x_y_cross='\u253C'          # -|-

function long_x_border {    # To render more like squares.
    for i in {0..2}
    do
        printf $x_border
    done
}

function x_border {         # Wrapper for x with y exceptions.
    printf $left_y
    long_x_border
    printf $x_y_cross
    long_x_border
    printf $x_y_cross
    long_x_border
    printf $right_y
    echo
}

function print_row {        # Print a whole row with selected chars inside.
    printf $y_border
    printf $space
    printf $1
    printf $space
    printf $y_border
    printf $space
    printf $2
    printf $space
    printf $y_border
    printf $space
    printf $3
    printf $space
    printf $y_border
    echo
}

# Upper border.
printf $left_upper_corner
long_x_border
printf $upper_x
long_x_border
printf $upper_x
long_x_border
printf $right_upper_corner
echo

# Rows
print_row $o $space $space
x_border
print_row $o x $space
x_border
print_row $x $space $space

# Lower border.
printf $left_lower_corner
long_x_border
printf $lower_x
long_x_border
printf $lower_x
long_x_border
printf $right_lower_corner
echo
