#!/bin/bash
var1="valor qualquer"

if test var1; then
    echo "A variável 'var1' foi preenchida e passou no comando 'test'"
    echo "O valor dela é '$var1'".
else
    echo A variável não foi preenchida.
fi
