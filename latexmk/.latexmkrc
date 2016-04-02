#!/usr/bin/env perl
$latex = 'platex -synctex=1 -halt-on-error %O %S';
$bibtex = 'pbibtex %O %B';
$dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'mendex %O -o %D %S';
$pdf_previewer ='';
$max_repeat = 10;
$pdf_mode = 3;

