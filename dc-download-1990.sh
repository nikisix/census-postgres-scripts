#not using wget recursively b/c the census' robots.txt forbids it
#download and unzip the summary file tables for the 1990 decenneal census
#no use in parallizing this download b/c the census' ftp site limits each ip to one ftp connection at a time
#tmux
#sudo apt-get install aria2

cd /zdrive/dc1990
mkdir sf1a sf1b sf2a sf2b sf2c sf3a sf3b sf3c

#SUMMARY FILE 1A
#aria2c --dir=sf1a --max-connection-per-server=5 --parameterized-uri=true --force-sequential=true \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-AK.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-AL.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-AR.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-AZ.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-CA.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-CO.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-CT.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-DC.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-DE.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-FL.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-GA.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-GU.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-HI.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-IA.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-ID.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-IL.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-IN.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-KS.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-KY.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-LA.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-MA.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-MD.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-ME.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-MI.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-MN.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-MO.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-MS.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-MT.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-NC.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-ND.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-NE.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-NH.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-NJ.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-NM.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-NV.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-NY.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-OH.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-OK.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-OR.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-PA.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-PR.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-RI.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-SC.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-SD.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-TN.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-TX.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-UT.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-VA.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-VI.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-VT.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-WA.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-WI.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-WV.ZIP" \
    #"http://www2.census.gov/census_1990/STF1A_ASCII/90STF1A-WY.ZIP"


#SUMMARY FILE 1B
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
aria2c --dir=sf2a --max-connection-per-server=5 --parameterized-uri=true --force-sequential=true \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-AK.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-AL.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-AR.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-AZ.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-CA.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-CO.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-CT.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-DC.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-DE.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-FL.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-GA.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-HI.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-IA.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-ID.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-IL.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-IN.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-KS.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-KY.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-LA.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-MA.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-MD.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-ME.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-MI.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-MN.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-MO.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-MS.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-MT.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-NC.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-ND.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-NE.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-NH.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-NJ.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-NM.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-NV.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-NY.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-OH.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-OK.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-OR.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-PA.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-PR.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-RI.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-SC.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-SD.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-TN.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-TX.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-UT.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-VA.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-VI.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-VT.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-WA.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-WI.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-WV.zip" \
    "http://www2.census.gov/census_1990/STF2A_ASCII/STF2A-WY.zip" 

##SUMMARY FILE 2B
aria2c --dir=sf2b --max-connection-per-server=5 --parameterized-uri=true --force-sequential=true \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-AK.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-AL.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-AR.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-AZ.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-CA.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-CO.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-CT.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-DC.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-DE.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-FL.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-GA.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-HI.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-IA.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-ID.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-IL.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-IN.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-KS.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-KY.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-LA.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-MA.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-MD.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-ME.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-MI.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-MN.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-MO.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-MS.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-MT.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-NC.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-ND.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-NE.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-NH.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-NJ.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-NM.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-NV.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-NY.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-OH.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-OK.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-OR.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-PA.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-PR.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-RI.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-SC.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-SD.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-TN.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-TX.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-UT.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-VA.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-VT.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-WA.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-WI.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-WV.zip" \
    "http://www2.census.gov/census_1990/STF2B_ASCII/STF2B-WY.zip" 

##SUMMARY FILE 2C
aria2c --dir=sf2c --max-connection-per-server=5 --parameterized-uri=true --force-sequential=true \
    "http://www2.census.gov/census_1990/STF2C_ASCII/STF2CxUS.ZIP"

##SUMMARY FILE 3A
aria2c --dir=sf3a --max-connection-per-server=5 --parameterized-uri=true --force-sequential=true \
http://www2.census.gov/census_1990/
http://www2.census.gov/census_1990/CD90_3A_01/all.zip
aria2c --dir=sf3b --max-connection-per-server=5 --parameterized-uri=true --force-sequential=true \
http://www2.census.gov/census_1990/
http://www2.census.gov/census_1990/CD90_3A_01/all.zip
aria2c --dir=sf3c --max-connection-per-server=5 --parameterized-uri=true --force-sequential=true \
http://www2.census.gov/census_1990/
http://www2.census.gov/census_1990/CD90_3A_01/all.zip
