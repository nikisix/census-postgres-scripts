#!/bin/bash

# this craps out on stf1a8tx.dbf upload that is actually a success but sends a can't reach end of record warning
#set -o errexit 

set -o nounset # fail on unset variables
set -o pipefail

#not using wget recursively b/c the census' robots.txt forbids it
#download and unzip the summary file tables for the 1990 decenneal census
#no use in parallizing this download b/c the census' ftp site limits each ip to one ftp connection at a time
#tmux
#sudo apt-get install aria2

cd /zdrive/dc1990
mkdir -p sf1a sf1b sf2a sf2b sf2c sf3a sf3b sf3c fix


#SUMMARY FILE 1A
#all data and info can be found here: http://www2.census.gov/census_1990/1990STF1.html
#sf1_1a_links=(
    #"http://www2.census.gov/census_1990/CD90_1A_1"
    #"http://www2.census.gov/census_1990/CD90_1A_2_1"
    #"http://www2.census.gov/census_1990/CD90_1A_2_2"
    #"http://www2.census.gov/census_1990/CD90_1A_3_1"
    #"http://www2.census.gov/census_1990/CD90_1A_3_2"
    #"http://www2.census.gov/census_1990/CD90_1A_3_3"
    #"http://www2.census.gov/census_1990/CD90_1A_4_1"
    #"http://www2.census.gov/census_1990/CD90_1A_4_2"
    #"http://www2.census.gov/census_1990/CD90_1A_5_1"
    #"http://www2.census.gov/census_1990/CD90_1A_5_2"
    #"http://www2.census.gov/census_1990/CD90_1A_5_3"
    #"http://www2.census.gov/census_1990/CD90_1A_6"
    #"http://www2.census.gov/census_1990/CD90_1A_7_1"
    #"http://www2.census.gov/census_1990/CD90_1A_7_2"
    #"http://www2.census.gov/census_1990/CD90_1A_8"
    #"http://www2.census.gov/census_1990/CD90_1A_9_1"
    #"http://www2.census.gov/census_1990/CD90_1A_9_2"
    #"http://www2.census.gov/census_1990/CD90_1A_PR"
#)

#for i in "${sf1_1a_links[@]}"; do
    #echo "Downloading: " $i
    #wget --directory-prefix=sf1a --accept dbf --mirror --adjust-extension --convert-links\
         #--backup-converted --no-parent -e robots=off --level=1 --random-wait\
         #$i
#done
#Note: one repeated file:
    #./CD90_1A_4_2/cnamesla.dbf
    #./CD90_1A_7_1/cnamesla.dbf


#TODO download fixes and overwrite original erred files
#wget --directory-prefix=fix --accept zip -r -k -m -np -e robots=off http://www.census.gov/support/revised.html

#change to where the files landed
#cd /zdrive/dc1990/sf1a-test/www2.census.gov/census_1990
##mv */* /zdrive/dc1990/sf1a #copy all files back up to sf1a parent folder
#cd /zdrive/dc1990/sf1a-test
##rm -r ./www2.census.gov/ #not sure why this doesnt work

#create loading schema
#psql -hlocalhost -Upostgres -dpropdata -c 'create schema dc1990load;'

##copy the files to the database landing schema

cd /zdrive/dc1990/fix/download

###unzip
#find . -name "stf*.zip" -exec unzip '{}' \;
#rm *.TXT #remove the documentation files

##rename everything to lower - necessary to overwrite files that need patched
#for f in *.DBF; do mv $f ${f,,}; done;

#apply the patch
#cp /zdrive/dc1990/fix/download/stf1a*.dbf /zdrive/dc1990/sf1a
#cp /zdrive/dc1990/fix/download/stf1b*.dbf /zdrive/dc1990/sf1b
#cp /zdrive/dc1990/fix/download/stf1c*.dbf /zdrive/dc1990/sf1c
#cp /zdrive/dc1990/fix/download/stf2a*.dbf /zdrive/dc1990/sf2a
#cp /zdrive/dc1990/fix/download/stf2b*.dbf /zdrive/dc1990/sf2b
#cp /zdrive/dc1990/fix/download/stf2c*.dbf /zdrive/dc1990/sf2c
#cp /zdrive/dc1990/fix/download/stf3a*.dbf /zdrive/dc1990/sf3a
#cp /zdrive/dc1990/fix/download/stf3b*.dbf /zdrive/dc1990/sf3b
#cp /zdrive/dc1990/fix/download/stf3c*.dbf /zdrive/dc1990/sf3c

#upload sf1a
cd /zdrive/dc1990/sf1a
#create landing tables 0-9
#for i in $(seq 0 9); do
    #echo Creating "stf1a${i}al" | sed -e "s/stf1a${i}al/dc1990load.stf1a${i}/g"
    #pgdbf -T "stf1a${i}al.dbf" | sed -n '1,2'p | sed -e "s/stf1a${i}al/dc1990load.stf1a${i}/g" | psql -dpropdata -hlocalhost -Upostgres
#done;

#learned that fix files have spaces instead of 0s in many fields and replacing spaces with fields must be done
#fix files that don't work
#stf1a8mi.dbf #re-replace with original fixes
#cp /zdrive/dc1990/fix/download/stf1a8mi.dbf /zdrive/dc1990/sf1a/stf1a8mi.dbf

#copy the data into created tables
#for i in {0..9}; do
	#psql -hlocalhost -dpropdata -Upostgres -c "delete from dc1990load.stf1a${i} ;"
    #for file in $(ls stf1a${i}*); do
        ##Remove first and last line as they're from the copy command; which pgdbf has no flag to remove these.
		##T - remove wrapper transaction. C - remove create table statement.
		##Replace missing bytes with 0's instead of spaces
        #echo $file
        #pgdbf -TC $file |\
		#sed -n -e '$d' -e '2,$'p |\
		#sed -e 's/ /0/g' |\
		#psql -hlocalhost -dpropdata -Upostgres -c "COPY dc1990load.stf1a${i} FROM STDIN"
    #done;
#done;

#TODO copy these into separate script files
#SUMMARY FILE 1B
#cd /zdrive/dc1990
#aria2c --dir=sf1b --max-connection-per-server=5 --parameterized-uri=true --force-sequential=true \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-AK.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-AKh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-AL.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-ALh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-AR.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-ARh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-AZ.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-AZh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-CA.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-CAh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-CO.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-COh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-CT.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-CTh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-DC.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-DCh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-DE.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-DEh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-FL.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-FLh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-GA.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-GAh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-HI.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-HIh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-IA.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-IAh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-ID.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-IDh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-IL.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-ILh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-IN.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-INh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-KS.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-KSh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-KY.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-KYh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-LA.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-LAh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-MA.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-MAh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-MD.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-MDh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-ME.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-MEh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-MI.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-MIh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-MN.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-MNh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-MO.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-MOh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-MS.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-MSh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-MT.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-MTh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-NC.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-NCh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-ND.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-NDh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-NE.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-NEh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-NH.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-NHh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-NJ.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-NJh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-NM.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-NMh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-NV.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-NVh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-NY.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-NYh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-OH.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-OHh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-OK.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-OKh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-OR.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-ORh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-PA.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-PAh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-PR.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-PRh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-RI.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-RIh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-SC.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-SCh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-SD.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-SDh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-TN.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-TNh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-TX.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-TXh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-UT.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-UTh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-VA.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-VAh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-VI.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-VIh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-VT.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-VTh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-WA.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-WAh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-WI.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-WIh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-WV.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-WVh.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-WY.zip" \
    #"http://www2.census.gov/census_1990/STF1B_ASCII/STF1B-WYh.zip"

##SUMMARY FILE 2A
#cd /zdrive/dc1990
#aria2c --dir=sf2a --max-connection-per-server=5 --parameterized-uri=true --force-sequential=true \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-AK.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-AL.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-AR.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-AZ.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-CA.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-CO.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-CT.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-DC.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-DE.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-FL.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-GA.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-HI.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-IA.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-ID.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-IL.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-IN.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-KS.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-KY.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-LA.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-MA.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-MD.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-ME.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-MI.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-MN.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-MO.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-MS.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-MT.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-NC.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-ND.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-NE.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-NH.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-NJ.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-NM.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-NV.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-NY.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-OH.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-OK.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-OR.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-PA.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-PR.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-RI.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-SC.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-SD.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-TN.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-TX.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-UT.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-VA.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-VI.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-VT.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-WA.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-WI.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-WV.zip" \
    #"http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-WY.zip" 

###SUMMARY FILE 2B
#cd /zdrive/dc1990
#aria2c --dir=sf2b --max-connection-per-server=5 --parameterized-uri=true --force-sequential=true \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-AK.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-AL.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-AR.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-AZ.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-CA.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-CO.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-CT.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-DC.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-DE.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-FL.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-GA.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-HI.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-IA.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-ID.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-IL.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-IN.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-KS.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-KY.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-LA.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-MA.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-MD.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-ME.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-MI.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-MN.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-MO.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-MS.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-MT.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-NC.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-ND.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-NE.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-NH.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-NJ.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-NM.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-NV.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-NY.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-OH.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-OK.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-OR.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-PA.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-PR.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-RI.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-SC.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-SD.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-TN.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-TX.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-UT.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-VA.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-VT.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-WA.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-WI.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-WV.zip" \
    #"http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-WY.zip" 

#SUMMARY FILE 2C
#cd /zdrive/dc1990
#aria2c --dir=sf2c --max-connection-per-server=5 --parameterized-uri=true --force-sequential=true \
    #"http://www2.census.gov/census_1990/STF2C_ASCII/STF2CxUS.ZIP"

#SUMMARY FILE 3A
#cd /zdrive/dc1990
#for i in {01..21};do
    #wget --directory-prefix=sf3a --accept dbf --mirror --adjust-extension --convert-links\
     #--backup-converted --no-parent -e robots=off --level=1 --random-wait\
     #"http://www2.census.gov/census_1990/CD90_3A_$i/"
#done&
#for j in {22..41};do
    #wget --directory-prefix=sf3a --accept dbf --mirror --adjust-extension --convert-links\
     #--backup-converted --no-parent -e robots=off --level=1 --random-wait\
     #"http://www2.census.gov/census_1990/CD90_3A_$j/"
#done&
#for k in {42..61};do
    #wget --directory-prefix=sf3a --accept dbf --mirror --adjust-extension --convert-links\
     #--backup-converted --no-parent -e robots=off --level=1 --random-wait\
     #"http://www2.census.gov/census_1990/CD90_3A_$k/"
#done&
