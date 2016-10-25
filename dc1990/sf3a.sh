#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

cd /zdrive/dc1990
mkdir -p sf1a sf1b sf2a sf2b sf2c sf3a sf3b sf3c fix

#SUMMARY FILE 3A
cd /zdrive/dc1990
##TODO try this: for i in {01..02};do#--no-directories 
#for i in {01..21};do
    #wget --directory-prefix=sf3a --accept dbf --mirror --adjust-extension --convert-links\
     #--backup-converted --no-parent -e robots=off --level=1 --random-wait\
     #"http://www2.census.gov/census_1990/cd90_3a_$i/"
#done&
#for j in {22..41};do
    #wget --directory-prefix=sf3a --accept dbf --mirror --adjust-extension --convert-links\
     #--backup-converted --no-parent -e robots=off --level=1 --random-wait\
     #"http://www2.census.gov/census_1990/cd90_3a_$j/"
#done&
#for k in {42..61};do
    #wget --directory-prefix=sf3a --accept dbf --mirror --adjust-extension --convert-links\
     #--backup-converted --no-parent -e robots=off --level=1 --random-wait\
     #"http://www2.census.gov/census_1990/cd90_3a_$k/"
#done&


#cd /zdrive/dc1990/sf3a/www2.census.gov/census_1990
#mv */* ../..
cd /zdrive/dc1990/sf3a/

#Apply fix files - should be done in sf1a (first) script
#cp /zdrive/dc1990/fix/download/stf3*.dbf /zdrive/dc1990/sf3a/


#create landing tables 300-334
#for i in {300..334}; do
    #echo Creating "stf${i}al" | sed -e "s/stf${i}al/dc1990load.stf${i}/g"
    #pgdbf -T "stf${i}al.dbf" |\
     #sed -n '1,2'p | sed -e "s/stf${i}al/dc1990load.stf${i}/g" |\
     #psql -dpropdata -hlocalhost -Upostgres
#done;


for i in {300..334}; do
	psql -hlocalhost -dpropdata -Upostgres -c "delete from dc1990load.stf${i} ;"
    for file in $(ls stf${i}*); do
        echo $file
        #replace missing bytes with 0's. chop off first and last line. 
        #remove leading zeros if they preceed a negative sign (e.g. 000-12 -> -12); former messses up pg copy command
        pgdbf -TC $file |\
		sed -n -e '$d' -e '2,$'p |\
		sed -e 's/ /0/g' -re 's/[0]+-/-/g' |\
		psql -hlocalhost -dpropdata -Upostgres -c "COPY dc1990load.stf${i} FROM STDIN"
    done;
done;

