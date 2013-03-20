#!/bin/bash
# Unquotes Dia .tex figures in order to correctly output the latex formulas
#
# usage ./dia-to-latex file1.tex file2.tex ... filen.tex
for i in "$@";
do
    echo Go for $i
    echo Cleaning $
    perl -pi -e 's/\\\$/\$/g' $i 

    echo Cleaning {
    perl -pi -e 's/\\{/{/g' $i 
    echo Cleaning }
    perl -pi -e 's/\\}/}/g' $i 
    echo Cleaning _
    perl -pi -e 's/\\\_/_/g' $i 
    echo Cleaning ^
    perl -pi -e 's/\\\^/^/g' $i 
    echo Cleaning \\
    perl -pi -e 's/\\ensuremath{\\backslash}/\\/g' $i
    # The "^" inside the formula outputs as ^{}{text}, so we remove the first {}
    echo Cleaning ^{}
    perl -pi -e 's/\^{}/^/g' $i
    echo Cleaning \\~{}
    perl -pi -e 's/\\~{}/~/g' $i 
done;
