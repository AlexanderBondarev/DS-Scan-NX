#!/bin/bash

ph=`pwd`
#dst=$ph/$1/Plot/$1
dst=$ph/Plot-$1
mkdir -p $dst
cd $1
echo "<html><head></head><body> <h3>Scanning the surface of potential energy when changing the N<sup>2</sup>-X distance for diazonium salts (DFT B3LYP 6-31G(d,p)):</h3> <ul>" > $dst/$1.html

for i in *-Scan*; do
# Name=`basename "$i" .relaxscanscf.dat`
 Name=$i
 echo "Name [$Name]"
 mkdir -p $dst/$Name
 mkdir -p $dst/$Name/img
 mkdir -p $dst/$Name/mol
 mkdir -p $dst/$Name/extremum
 mkdir -p $dst/$Name/dop
 cd $Name

 MolName=`php $ph/make-name.php $Name`

 echo "   <li><a href=\""$Name"/"$Name".html\">"$MolName"</a></li>" >> $dst/$1.html
 cp $Name.*.mol $dst/$Name/mol
 php $ph/sort-scan-dat.php $Name $ph $dst
 cp $Name.csv scan.csv
 gnuplot $ph/scan-plot.gnu
 cp scan.png $dst/$Name/img/$Name.png
 cp scan-eh.png $dst/$Name/img/$Name-eh.png
 cp scan.svg $dst/$Name/img/$Name.svg
 cp scan-eh.svg $dst/$Name/img/$Name-eh.svg
 cp $Name.csv $dst/$Name/dop
 cp $Name.html $dst/$Name
 cp scan.csv $dst/$Name.csv
 cp $Name.*.png $dst/$Name/img

# wd=`pwd`
# cd $dst/$Name/img
# $ph/make-png2mpg.sh $Name
# cd $wd
 cd ..
done

echo " </ul></body></html>" >> $dst/$1.html

cd ..
