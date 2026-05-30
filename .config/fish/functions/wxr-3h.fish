function wxr-3h --wraps="curl 'https://aviationweather.gov/api/data/metar?ids=hkjk,hknw,hkni,hkmo,hkem,hkel,hkki,hkml&hours=3'" --description "alias wxr-3h=curl 'https://aviationweather.gov/api/data/metar?ids=hkjk,hknw,hkni,hkmo,hkem,hkel,hkki,hkml&hours=3'"
    curl 'https://aviationweather.gov/api/data/metar?ids=hkjk,hknw,hkni,hkmo,hkem,hkel,hkki,hkml&hours=3' $argv
end
