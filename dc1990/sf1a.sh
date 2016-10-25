#!/bin/bash

# this craps out on stf1a8tx.dbf upload that is actually a success but sends a can't reach end of record warning
#set -o errexit 

set -o nounset # fail on unset variables
set -o pipefail

#not using wget recursively b/c the census' robots.txt forbids it
#download and unzip the summary file tables for the 1990 decenneal census
#no use in parallizing this download b/c the census' ftp site limits each ip to one ftp connection at a time
#tmux
sudo apt-get install aria2

cd /zdrive/dc1990
mkdir -p sf1a sf1b sf2a sf2b sf2c sf3a sf3b sf3c fix


#SUMMARY FILE 1A
#all data and info can be found here: http://www2.census.gov/census_1990/1990STF1.html
sf1_1a_links=(
    "http://www2.census.gov/census_1990/CD90_1A_1"
    "http://www2.census.gov/census_1990/CD90_1A_2_1"
    "http://www2.census.gov/census_1990/CD90_1A_2_2"
    "http://www2.census.gov/census_1990/CD90_1A_3_1"
    "http://www2.census.gov/census_1990/CD90_1A_3_2"
    "http://www2.census.gov/census_1990/CD90_1A_3_3"
    "http://www2.census.gov/census_1990/CD90_1A_4_1"
    "http://www2.census.gov/census_1990/CD90_1A_4_2"
    "http://www2.census.gov/census_1990/CD90_1A_5_1"
    "http://www2.census.gov/census_1990/CD90_1A_5_2"
    "http://www2.census.gov/census_1990/CD90_1A_5_3"
    "http://www2.census.gov/census_1990/CD90_1A_6"
    "http://www2.census.gov/census_1990/CD90_1A_7_1"
    "http://www2.census.gov/census_1990/CD90_1A_7_2"
    "http://www2.census.gov/census_1990/CD90_1A_8"
    "http://www2.census.gov/census_1990/CD90_1A_9_1"
    "http://www2.census.gov/census_1990/CD90_1A_9_2"
    "http://www2.census.gov/census_1990/CD90_1A_PR"
)

#download summary file 1a
for i in "${sf1_1a_links[@]}"; do
    echo "Downloading: " $i
    wget --directory-prefix=sf1a --accept dbf --mirror --adjust-extension --convert-links\
         --backup-converted --no-parent -e robots=off --level=1 --random-wait\
         $i
done

#Note: one repeated file:
    #./CD90_1A_4_2/cnamesla.dbf
    #./CD90_1A_7_1/cnamesla.dbf

wget --directory-prefix=fix --accept zip -r -k -m -np -e robots=off http://www.census.gov/support/revised.html

change to where the files landed
cd /zdrive/dc1990/sf1a/www2.census.gov/census_1990
mv */* /zdrive/dc1990/sf1a #copy all files back up to sf1a parent folder
cd /zdrive/dc1990/sf1a
#rm -r ./www2.census.gov/ #not sure why this doesnt work

#create loading schema
psql -hlocalhost -Upostgres -dpropdata -c 'create schema dc1990load;'

##copy the files to the database landing schema

cd /zdrive/dc1990/fix/download

##unzip
find . -name "stf*.zip" -exec unzip '{}' \;
rm *.TXT #remove the documentation files

#rename everything to lower - necessary to overwrite files that need patched
for f in *.DBF; do mv $f ${f,,}; done;

#apply the patch
cp /zdrive/dc1990/fix/download/stf1a*.dbf /zdrive/dc1990/sf1a
cp /zdrive/dc1990/fix/download/stf1b*.dbf /zdrive/dc1990/sf1b
cp /zdrive/dc1990/fix/download/stf1c*.dbf /zdrive/dc1990/sf1c
cp /zdrive/dc1990/fix/download/stf2a*.dbf /zdrive/dc1990/sf2a
cp /zdrive/dc1990/fix/download/stf2b*.dbf /zdrive/dc1990/sf2b
cp /zdrive/dc1990/fix/download/stf2c*.dbf /zdrive/dc1990/sf2c
#cp /zdrive/dc1990/fix/download/stf3a*.dbf /zdrive/dc1990/sf3a
cp /zdrive/dc1990/fix/download/stf3*.dbf /zdrive/dc1990/sf3a/
cp /zdrive/dc1990/fix/download/stf3b*.dbf /zdrive/dc1990/sf3b
cp /zdrive/dc1990/fix/download/stf3c*.dbf /zdrive/dc1990/sf3c

#upload sf1a
cd /zdrive/dc1990/sf1a

#create landing tables 0-9
for i in $(seq 0 9); do
    echo Creating "stf1a${i}al" | sed -e "s/stf1a${i}al/dc1990load.stf1a${i}/g"
    pgdbf -T "stf1a${i}al.dbf" | sed -n '1,2'p | sed -e "s/stf1a${i}al/dc1990load.stf1a${i}/g" | psql -dpropdata -hlocalhost -Upostgres
done;

#learned that fix files have spaces instead of 0s in many fields and replacing spaces with fields must be done
#fix files that don't work
#stf1a8mi.dbf #re-replace with original fixes
cp /zdrive/dc1990/fix/download/stf1a8mi.dbf /zdrive/dc1990/sf1a/stf1a8mi.dbf

#copy the data into created tables
for i in {0..9}; do
	psql -hlocalhost -dpropdata -Upostgres -c "delete from dc1990load.stf1a${i} ;"
    for file in $(ls stf1a${i}*); do
        #Remove first and last line as they're from the copy command; which pgdbf has no flag to remove these.
		#T - remove wrapper transaction. C - remove create table statement.
		#Replace missing bytes with 0's instead of spaces
        echo $file
        pgdbf -TC $file |\
		sed -n -e '$d' -e '2,$'p |\
		sed -e 's/ /0/g' |\
		psql -hlocalhost -dpropdata -Upostgres -c "COPY dc1990load.stf1a${i} FROM STDIN"
    done;
done;
