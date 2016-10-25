#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

cd /zdrive/dc1990

#create meta tables
pgdbf sf1a/tables.dbf | sed '1,4s/ tables / dc1990load.meta1a /g' | psql -dpropdata -hlocalhost -Upostgres
pgdbf sf3a/tables.dbf | sed '1,4s/ tables / dc1990load.meta3a /g' | psql -dpropdata -hlocalhost -Upostgres

bash ./sf1a.sh
bash ./sf3a.sh
