#not using wget recursively b/c the census' robots.txt forbids it
#download and unzip the summary file tables for the 2000 decenneal census
#no use in parallizing this download b/c the census' ftp site limits each ip to one ftp connection at a time
#tmux
#sudo apt-get install aria2
#cd ~/download/2000
##cd /zdrive
#mkdir sf1 sf2 sf3 sf4
#cd sf1
#curl ftp://ftp.census.gov/census_2000/datasets/Summary_File_1/0Final_National/all_0Final_National.zip > ./sf1/all_0Final_National.zip
#unzip ./sf1/all_0Final_National.zip
#cd ../sf2
#curl ftp://ftp.census.gov/census_2000/datasets/Summary_File_2/0Final_National/all_0Final_National.zip -o all_0Final_National.zip
#unzip ./sf2/all_0Final_National.zip
#cd ../sf3
#curl ftp://ftp.census.gov/census_2000/datasets/Summary_File_3/0_National/all_0_National-part1.zip -o all_0_National-part1.zip
#curl ftp://ftp.census.gov/census_2000/datasets/Summary_File_3/0_National/all_0_National-part2.zip -o all_0_National-part2.zip
# 
#unzip ./sf3/all_0Final_National.zip
#cd ../sf4
#curl ftp://ftp.census.gov/census_2000/datasets/Summary_File_4/0Final_National/all_0Final_National.zip -o all_0Final_National.zip
#unzip ./sf4/all_0Final_National.zip
#
#curl --remote-name http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Rhode_Island/ri0000[1-9]_uf1.zip
#curl --remote-name http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Rhode_Island/ri000[10-39]_uf1.zip


aria2c --dir=sf1 --max-connection-per-server=5 --parameterized-uri=true --force-sequential=true \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Alabama/al0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Alabama/al000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Alabama/algeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Alaska/ak0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Alaska/ak000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Alaska/akgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Arizona/az0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Arizona/az000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Arizona/azgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Arkansas/ar0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Arkansas/ar000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Arkansas/argeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/California/ca0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/California/ca000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/California/cageo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Colorado/co0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Colorado/co000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Colorado/cogeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Connecticut/ct0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Connecticut/ct000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Connecticut/ctgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Delaware/de0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Delaware/de000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Delaware/degeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/District_of_Columbia/dc0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/District_of_Columbia/dc000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/District_of_Columbia/dcgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Florida/fl0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Florida/fl000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Florida/flgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Georgia/ga0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Georgia/ga000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Georgia/gageo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Hawaii/hi0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Hawaii/hi000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Hawaii/higeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Idaho/id0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Idaho/id000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Idaho/idgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Illinois/il0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Illinois/il000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Illinois/ilgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Indiana/in0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Indiana/in000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Indiana/ingeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Iowa/ia0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Iowa/ia000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Iowa/iageo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Kansas/ks0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Kansas/ks000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Kansas/ksgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Kentucky/ky0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Kentucky/ky000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Kentucky/kygeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Louisiana/la0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Louisiana/la000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Louisiana/lageo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Maine/me0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Maine/me000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Maine/megeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Maryland/md0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Maryland/md000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Maryland/mdgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Massachusetts/ma0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Massachusetts/ma000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Massachusetts/mageo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Michigan/mi0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Michigan/mi000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Michigan/migeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Minnesota/mn0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Minnesota/mn000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Minnesota/mngeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Mississippi/ms0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Mississippi/ms000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Mississippi/msgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Missouri/mo0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Missouri/mo000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Missouri/mogeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Montana/mt0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Montana/mt000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Montana/mtgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Nebraska/ne0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Nebraska/ne000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Nebraska/negeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Nevada/nv0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Nevada/nv000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Nevada/nvgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/New_Hampshire/nh0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/New_Hampshire/nh000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/New_Hampshire/nhgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/New_Jersey/nj0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/New_Jersey/nj000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/New_Jersey/njgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/New_Mexico/nm0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/New_Mexico/nm000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/New_Mexico/nmgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/New_York/ny0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/New_York/ny000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/New_York/nygeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/North_Carolina/nc0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/North_Carolina/nc000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/North_Carolina/ncgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/North_Dakota/nd0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/North_Dakota/nd000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/North_Dakota/ndgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Ohio/oh0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Ohio/oh000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Ohio/ohgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Oklahoma/ok0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Oklahoma/ok000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Oklahoma/okgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Oregon/or0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Oregon/or000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Oregon/orgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Pennsylvania/pa0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Pennsylvania/pa000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Pennsylvania/pageo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Puerto_Rico/pr0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Puerto_Rico/pr000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Puerto_Rico/prgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Rhode_Island/ri0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Rhode_Island/ri000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Rhode_Island/rigeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/South_Carolina/sc0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/South_Carolina/sc000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/South_Carolina/scgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/South_Dakota/sd0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/South_Dakota/sd000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/South_Dakota/sdgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Tennessee/tn0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Tennessee/tn000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Tennessee/tngeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Texas/tx0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Texas/tx000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Texas/txgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Utah/ut0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Utah/ut000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Utah/utgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Vermont/vt0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Vermont/vt000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Vermont/vtgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Virginia/va0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Virginia/va000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Virginia/vageo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Washington/wa0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Washington/wa000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Washington/wageo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/West_Virginia/wv0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/West_Virginia/wv000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/West_Virginia/wvgeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Wisconsin/wi0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Wisconsin/wi000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Wisconsin/wigeo_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Wyoming/wy0000[1-9]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Wyoming/wy000[10-39]_uf1.zip" \
"http://www2.census.gov/ftp/census_2000/datasets/Summary_File_1/Wyoming/wygeo_uf1.zip" \



#add these in
#0File_Structure_README.doc
#0File_Structure_README.txt
#0Final_National
#0README_SF1.doc
#0README_SF1.txt
#Advance_National
