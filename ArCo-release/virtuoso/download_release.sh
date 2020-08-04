#!/bin/bash

KG_VERSION=$1

mkdir /d
cd /d/

wget http://arco.istc.cnr.it/arco-data/${KG_VERSION}/index.txt

while read in; do wget "http://arco.istc.cnr.it/arco-data/${KG_VERSION}/$in"; done < index.txt

i=1
for f in *.nt.gz; 
do
echo creating directory: $i
mkdir $i
mv $f $i
((i=i+1))
done

rm index.txt


mkdir /linking
cd /linking/

wget http://arco.istc.cnr.it/arco-data/${KG_VERSION}/linking/index.txt

while read in; do wget "http://arco.istc.cnr.it/arco-data/${KG_VERSION}/linking/$in"; done < index.txt

i=1
for f in *.nt.gz; 
do
echo creating directory: $i
mkdir $i
mv $f $i
((i=i+1))
done

rm index.txt

  
mkdir /quarantine
cd /quarantine
wget "http://arco.istc.cnr.it/arco-data/${KG_VERSION}/quarantine.nt.gz"