#!/bin/bash

ls > tmpo.txt

while read file ;
do
  echo $file
  diff $file ../../../../acd_design/clipper/uvm_verif/regmodel/src/$file > ../diff_file/$file.diff
done < tmpo.txt
