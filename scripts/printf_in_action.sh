#!/bin/bash
# printf demo

PI=3.14159265358979

echo

printf "Pi to 2 decimal places = %1.2f" $PI
echo
printf "Pi to 9 decimal places = %1.9f" $PI  # It even rounds off correctly.
printf "\n"                                  # Prints a line feed,
                                             # Equivalent to 'echo' . . .
