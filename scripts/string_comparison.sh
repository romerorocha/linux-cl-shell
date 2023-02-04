#!/bin/bash
# Using strings comparisons

string1=soccer
string2=zorbfootball

if [ $string1 \> $string2 ]; then # escaped >
    echo "$string1 is greater than $string2!"
else
    echo "$string1 is less than $string2!"
fi
