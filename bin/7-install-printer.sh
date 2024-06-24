#!/bin/bash

source "./rainbow.sh"

gA=$(echogreen "==>")

echo "$gA Install PPD for HP 107W..."

cd "../hp107w/" || 1
./install-printer.sh

echo "$gA Finish..."
