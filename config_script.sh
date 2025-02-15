#!/bin/bash

git config --global http.sslverify "false"
git config --global http.proxy http://kuzh.polytechnique.fr:8080

git config filter.sentencebreak.clean "perl -pe \"s/[.]*?(\\?|\\!|\\.|'') /$&%NL%\\n/g unless m/%/||m/^[\\ *\\\\\\]/\""
git config filter.sentencebreak.smudge "perl -pe \"s/%NL%\n//gm\""

fileArray=($(find . -iname "*.tex"))

for (( i=0; i<${#fileArray[@]}; i++ ));
do
    perl -pe "s/%NL%\n//gm" < ${fileArray[$i]} > temp
    mv temp ${fileArray[$i]}
done