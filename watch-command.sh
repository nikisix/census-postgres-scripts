#!/bin/bash
cd $1
watch -dn1 'for d in $(ls);do echo $d $(ls $d | wc -l); done;'
