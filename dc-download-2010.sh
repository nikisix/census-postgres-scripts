#!/bin/bash
mkdir -p /zdrive/dc2010
cd /zdrive/dc2010
mkdir sf1 sf2 sf3 sf4

#SUMMARY FILE 1
aria2c --dir=sf1 --max-connection-per-server=5 --parameterized-uri=true --force-sequential=true \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Alabama/al2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Alaska/ak2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Arizona/az2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Arkansas/ar2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/California/ca2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Colorado/co2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Connecticut/ct2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Delaware/de2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/District_of_Columbia/dc2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Florida/fl2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Georgia/ga2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Hawaii/hi2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Idaho/id2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Illinois/il2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Indiana/in2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Iowa/ia2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Kansas/ks2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Kentucky/ky2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Louisiana/la2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Maine/me2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Maryland/md2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Massachusetts/ma2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Michigan/mi2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Minnesota/mn2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Mississippi/ms2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Missouri/mo2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Montana/mt2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/National/us2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Nebraska/ne2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Nevada/nv2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/New_Hampshire/nh2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/New_Jersey/nj2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/New_Mexico/nm2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/New_York/ny2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/North_Carolina/nc2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/North_Dakota/nd2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Ohio/oh2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Oklahoma/ok2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Oregon/or2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Pennsylvania/pa2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Rhode_Island/ri2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/South_Carolina/sc2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/South_Dakota/sd2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Tennessee/tn2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Texas/tx2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Utah/ut2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Vermont/vt2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Virginia/va2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Washington/wa2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/West_Virginia/wv2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Wisconsin/wi2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/Wyoming/wy2010.sf1.zip" \
    "http://www2.census.gov/census_2010/04-Summary_File_1/SF1_Access2003.mdb" \
