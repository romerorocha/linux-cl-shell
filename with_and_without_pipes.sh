#!/bin/bash
echo "Printing sorted brew packages without using pipes:"
brew list >../tmp/brew.list
sort <../tmp/brew.list

echo "Printing sorted brew packages using pipes:"
brew list | sort

echo "Saving sorted brew packages using pipes:"
brew list | sort >../tmp/brew2.list
