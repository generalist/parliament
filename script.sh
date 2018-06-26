#!/bin/bash

curl "https://raw.githubusercontent.com/generalist/parliament/master/term-memberships" > working/memberships

rm working/report

for i in `cat working/memberships` ; do

sleep 5s

curl --header "Accept: text/tab-separated-values" https://query.wikidata.org/sparql?query=SELECT%20DISTINCT%20%3Fitem%20%3FitemLabel%20%3Fterm%20%3FtermLabel%20%3Fconstituency%20%3FconstituencyLabel%20%3Fparty%20%3FpartyLabel%20%3Fstart%20%3Felection%20%3FelectionLabel%20%3Fend%20%3Fcause%20%3FcauseLabel%20%7B%0A%20%3Fitem%20p%3AP39%20%3FpositionStatement%20.%0A%20%3FpositionStatement%20ps%3AP39%20wd%3A$i%20.%20%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP768%20%3Fconstituency%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP4100%20%3Fparty%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP580%20%3Fstart%20.%20%0A%20%20%20%20%20%20%20%20%20%20%20%20FILTER%28%20%21isBLANK%28%3Fstart%29%20%29%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP2715%20%3Felection%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP582%20%3Fend%20.%20%0A%20%20%20%20%20%20%20%20%20%20%20%20FILTER%28%20%21isBLANK%28%3Fend%29%20%29%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP1534%20%3Fcause%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP2937%20%3Fterm%20.%20%7D%0A%20SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%27en%27%20%7D%0A%7D%0AORDER%20BY%20%3Fitem%20%3Fstart > working/$i.tsv

# pull out the bits which are plain text

cut -f 1,2,4,6,8,9,11,12,14 working/$i.tsv | sed 's/<http:\/\/www.wikidata.org\/entity\///g' | sed 's/>//g' | sed 's/\^\^<http:\/\/www.w3.org\/2001\/XMLSchema#dateTime//g' | sed 's/T00:00:00Z//g' | sed 's/@en//g' | sed 's/\"//g' > working/$i-text.tsv

# pull out the bits which are data elements

cut -f 1,3,5,7,9,10,12,13 working/$i.tsv | sed 's/<http:\/\/www.wikidata.org\/entity\///g' | sed 's/>//g' | sed 's/\^\^<http:\/\/www.w3.org\/2001\/XMLSchema#dateTime//g' | sed 's/T00:00:00Z//g' | sed 's/@en//g' | sed 's/\"//g' > working/$i-data.tsv

curl "https://raw.githubusercontent.com/generalist/parliament/master/$i.tsv" > working/$i-reference.tsv

diff working/$i.tsv working/$i-reference.tsv
if [ $? -ne 0 ] 
then
    echo "CONCERN - Changes made to $i" >> working/report
    echo "discrepancies in:" >> working/report
    echo `diff Q41582555.tsv Q41582555-reference.tsv | cut -f 1 | grep entity | sed 's/<//g' | sed 's/>//g' | sort | uniq ` >> working/report
else
    echo "No change to $i" >> working/report
fi

done

DATE=$(date +%F)

cp working/report parliaments/report-$DATE
