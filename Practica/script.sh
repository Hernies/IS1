#Setup General
sudo apt-get install libz-dev
wget -O - http://m.m.i24.cc/osmfilter.c |cc -x c - -O3 -o osmfilter
wget -O - http://m.m.i24.cc/osmconvert.c | cc -x c - -lz -O3 -o osmconvert
bzcat spain-latest.osm.bz2 | ./osmconvert - -o=spain.o5m

###Parte 1
#Cada comando distinto, NO ES PIPELINE
./osmfilter spain.o5m --keep="amenity=cafe =bar =pub =restaurant =fast_food" -o=spain-amenities.osm
./osmconvert spain-amenities.osm -B=CiudadMadrid.poly.txt -o=madrid-amenities.osm
./osmconvert madrid-amenities.osm --all-to-nodes --csv="@id @lon @lat name opening_hours" --csv-separator="," -o=madrid-amenities.csv
awk '{if ($4) print $0;}' madrid-amenities.csv > madrid-amenities-notnull.csv



#PIPELINE 1

./osmfilter spain.o5m --keep="amenity=cafe =bar =pub =restaurant =fast_food" | ./osmconvert - -B=CiudadMadrid.poly.txt | ./osmconvert - --all-to-nodes --csv="@id @lon @lat name opening_hours" --csv-separator="," | awk '{if ($4) print $0;}' | python3 builddatabase.py


###Parte 2

./osmfilter spain.o5m --keep="amenity=restaurant cuisine=italian;mexican;peruvian" -o=spain-cuisine.o5m
./osmconvert spain-cuisine.o5m -B=CiudadMadrid.poly.txt -o=madrid-cuisine.o5m
./osmconvert madrid-cuisine.o5m --all-to-nodes --csv="@id @lon @lat name opening_hours" --csv-separator="," -o=madrid-cuisine.csv
awk '{if ($4) print $0;}' madrid-cuisine.csv > madrid-cuisine-notnull.csv

#PIPELINE 2

./osmfilter spain.o5m --keep="amenity=restaurant cuisine=italian;mexican;peruvian" | ./osmconvert - -B=CiudadMadrid.poly.txt | ./osmconvert - --all-to-nodes --csv="@id @lon @lat name opening_hours" --csv-separator="," | awk '{if ($4) print $0;}' | python3 builddatabase.py



