#!/bin/bash

# 56-57
curl --header "Accept: text/tab-separated-values" https://query.wikidata.org/sparql?query=SELECT%20DISTINCT%20%3Fitem%20%3FitemLabel%20%3Fterm%20%3FtermLabel%20%3Fconstituency%20%3FconstituencyLabel%20%3Fparty%20%3FpartyLabel%20%3Fstart%20%3Felection%20%3FelectionLabel%20%3Fend%20%3Fcause%20%3FcauseLabel%20%7B%0A%20%3Fitem%20p%3AP39%20%3FpositionStatement%20.%0A%20%20%20%20%20%20%20%7B%20%3FpositionStatement%20ps%3AP39%20wd%3AQ30524710%20.%20%7D%20%23%2057th%20-%202017%20onwards%0A%20union%20%7B%20%3FpositionStatement%20ps%3AP39%20wd%3AQ30524718%20.%20%7D%20%23%2056th%20-%202015-17%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP768%20%3Fconstituency%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP4100%20%3Fparty%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP580%20%3Fstart%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP2715%20%3Felection%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP582%20%3Fend%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP1534%20%3Fcause%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP2937%20%3Fterm%20.%20%7D%0A%20SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%27en%27%20%7D%0A%7D%0AORDER%20BY%20%3Fitem%20%3Fstart > working/56-57.tsv

# pull out the bits which are plain text or data elements

cut -f 1,2,4,6,8,9,11,12,14 working/56-57.tsv | sed 's/<http:\/\/www.wikidata.org\/entity\///g' | sed 's/>//g' | sed 's/\^\^<http:\/\/www.w3.org\/2001\/XMLSchema#dateTime//g' | sed 's/T00:00:00Z//g' | sed 's/@en//g' | sed 's/\"//g' > working/56-57-text.tsv

cut -f 1,3,5,7,9,10,12,13 working/56-57.tsv | sed 's/<http:\/\/www.wikidata.org\/entity\///g' | sed 's/>//g' | sed 's/\^\^<http:\/\/www.w3.org\/2001\/XMLSchema#dateTime//g' | sed 's/T00:00:00Z//g' | sed 's/@en//g' | sed 's/\"//g' > working/56-57-data.tsv

# 52-55

curl --header "Accept: text/tab-separated-values" https://query.wikidata.org/sparql?query=SELECT%20DISTINCT%20%3Fitem%20%3FitemLabel%20%3Fterm%20%3FtermLabel%20%3Fconstituency%20%3FconstituencyLabel%20%3Fparty%20%3FpartyLabel%20%3Fstart%20%3Felection%20%3FelectionLabel%20%3Fend%20%3Fcause%20%3FcauseLabel%20%7B%0A%20%3Fitem%20p%3AP39%20%3FpositionStatement%20.%0A%20%20%20%20%20%20%20%7B%20%3FpositionStatement%20ps%3AP39%20wd%3AQ35494253%20.%20%7D%20%23%2055th%20-%202010-15%20onwards%0A%20union%20%7B%20%3FpositionStatement%20ps%3AP39%20wd%3AQ35647955%20.%20%7D%20%23%2054th%20-%202005-10%0A%20union%20%7B%20%3FpositionStatement%20ps%3AP39%20wd%3AQ35921591%20.%20%7D%20%23%2053rd%20-%202001-05%0A%20union%20%7B%20%3FpositionStatement%20ps%3AP39%20wd%3AQ36634044%20.%20%7D%20%23%2052nd%20-%201997-2001%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP768%20%3Fconstituency%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP4100%20%3Fparty%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP580%20%3Fstart%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP2715%20%3Felection%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP582%20%3Fend%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP1534%20%3Fcause%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP2937%20%3Fterm%20.%20%7D%0A%20SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%27en%27%20%7D%0A%7D%0AORDER%20BY%20%3Fitem%20%3Fstart > working/52-55.tsv

# pull out the bits which are plain text

cut -f 1,2,4,6,8,9,11,12,14 working/52-55.tsv | sed 's/<http:\/\/www.wikidata.org\/entity\///g' | sed 's/>//g' | sed 's/\^\^<http:\/\/www.w3.org\/2001\/XMLSchema#dateTime//g' | sed 's/T00:00:00Z//g' | sed 's/@en//g' | sed 's/\"//g' > working/52-55-text.tsv

# pull out the bits which are data elements

cut -f 1,3,5,7,9,10,12,13 working/52-55.tsv | sed 's/<http:\/\/www.wikidata.org\/entity\///g' | sed 's/>//g' | sed 's/\^\^<http:\/\/www.w3.org\/2001\/XMLSchema#dateTime//g' | sed 's/T00:00:00Z//g' | sed 's/@en//g' | sed 's/\"//g' > working/52-55-data.tsv

# 45-51

# 38-44

# 32-37

# todo
# convert all these to use the new ?item ?start sort order - done
# split into plaintext and WD formats - done
# cut down a lot of the URIs for simplicity - done

# write a script to check against 
