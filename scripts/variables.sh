#!/bin/bash
#não pode haver espaço entre o sinal de igual, o nome e o valor da variável
days=10
guest="Maria"
echo "$guest checked in $days days ago."
days2=$days
guest="João"
echo "$guest checked in $days2 days ago."
