#!/bin/bash

# first, go to http://www1.ncdc.noaa.gov/pub/data/cmb/ersst/v4/netcdf/
# and save it from the browser (ctrl-S) as site.html

for i in $(grep -P -o 'http\:.*?[0-9]{6}\.nc' site.html) ; do curl -O $i ; done

# make time record dimension
mkdir -p recdim
for i in *.nc ; do
    ncks --mk_rec_dmn time $i recdim/$i
done


