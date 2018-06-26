#!/bin/bash

# 56-57

curl --header "Accept: text/tab-separated-values" https://query.wikidata.org/sparql?query=SELECT%20DISTINCT%20%3Fitem%20%3FitemLabel%20%3Fterm%20%3FtermLabel%20%3Fconstituency%20%3FconstituencyLabel%20%3Fparty%20%3FpartyLabel%20%3Fstart%20%3Felection%20%3FelectionLabel%20%3Fend%20%3Fcause%20%3FcauseLabel%20%7B%0A%20%3Fitem%20p%3AP39%20%3FpositionStatement%20.%0A%20%20%20%20%20%20%20%7B%20%3FpositionStatement%20ps%3AP39%20wd%3AQ30524710%20.%20%7D%20%23%2057th%20-%202017%20onwards%0A%20union%20%7B%20%3FpositionStatement%20ps%3AP39%20wd%3AQ30524718%20.%20%7D%20%23%2056th%20-%202015-17%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP768%20%3Fconstituency%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP4100%20%3Fparty%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP580%20%3Fstart%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP2715%20%3Felection%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP582%20%3Fend%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP1534%20%3Fcause%20.%20%7D%0A%20OPTIONAL%20%7B%20%3FpositionStatement%20pq%3AP2937%20%3Fterm%20.%20%7D%0A%20SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%27en%27%20%7D%0A%7D%0AORDER%20BY%20%3Fitem%20%3Fstart > working/56-57.tsv

# 52-55

# 45-51

# 38-44

# 32-37

# todo
# convert all these to use the new ?item ?start sort order
# split into plaintext and WD formats
# cut down a lot of the URIs for simplicity
