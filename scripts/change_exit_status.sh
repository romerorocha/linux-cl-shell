#!/bin/bash
var1=10
var2=30
var3=$((var1 * var2))
echo The value is $var3 # 300
exit $var3              # 44, modulo de 300 / 256
