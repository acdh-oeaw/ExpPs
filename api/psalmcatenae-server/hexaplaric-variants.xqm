(:~
 : API for querying psalmcatenae manuscripts for commentaryfragments, glosses, hexaplaric variants, and psalmtexts.
 :)
xquery version "3.1";

module namespace hexaplaric-variants = 'https://psalmcatenae.acdh-dev.oeaw.ac.at/psalmcatenae-server/hexaplaric-variants';

import module namespace admin = "http://basex.org/modules/admin";
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace request = "http://exquery.org/ns/request";
import module namespace xslt = "http://basex.org/modules/xslt";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace response-codes = "https://tools.ietf.org/html/rfc7231#section-6";

declare variable $hexaplaric-variants:enable-trace := true();

(:~
 : Returns a list of available hexaplaric variants from all transcribed manuscripts
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/hexaplaric-variants')
    %rest:produces('application/hal+json')
function hexaplaric-variants:get-list-of-hexaplaric-variants(){
  let $origin := try { request:header("Origin") } catch basex:http {'urn:local'}
  let $path := "/psalmcatenae-manuscripts"
  let $hexaplaric-variant-result-fragment := for $hexaplaric-variant in collection($path)//tei:seg[@type = 'hexaplaric'] return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/hexaplaric-variants/" || $hexaplaric-variant/@xml:id || """}}, ""attribution"" : """ || $hexaplaric-variant/@source || """}"
    let $hexaplaric-variants-as-json-result-fragment := string-join($hexaplaric-variant-result-fragment,',')
    let $hexaplaric-variants-as-json := "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/hexaplaric-variants"" }}, ""_embedded"" : { ""hexaplaric-variants"" : [" || $hexaplaric-variants-as-json-result-fragment || "]}}"
    return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$hexaplaric-variants-as-json}`]``)
};

(:~
 : Returns a particular hexaplaric variant.
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/hexaplaric-variants/{$hexaplaric-variant-id}')
    %rest:produces('application/hal+json')
function hexaplaric-variants:get-hexaplaric-variant($hexaplaric-variant-id as xs:string){
  let $origin := try { request:header("Origin") } catch basex:http {'urn:local'}
  let $path := "/psalmcatenae-manuscripts"
  let $corresp := for $hv-referencing in collection($path)//tei:seg[@type = 'hexaplaric'] 
    where $hv-referencing/@xml:id = $hexaplaric-variant-id
    return substring-after($hv-referencing/@corresp,'#')
  let $corresponding-psalm-anchor := for $anchor in collection($path)//tei:anchor[@type = 'psalmtext']
    where $anchor/@xml:id = $corresp
    return $anchor/@xml:id
  let $corresponding-psalm := for $psalm in collection($path)//tei:quote[@type = 'bibletext']
    where $psalm/child::tei:anchor/@xml:id = $corresponding-psalm-anchor
    return $psalm/@xml:id
  let $hexaplaric-variant-as-json := for $hv in collection($path)//tei:seg[@type = 'hexaplaric']
    where $hv/@xml:id = $hexaplaric-variant-id
    return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/hexaplaric-variants/" || $hexaplaric-variant-id || """}, ""psalm"" : { ""href"" : ""/psalmcatenae-server/psalmtexts/" || $corresponding-psalm || """}}, ""_embedded"" : " || xslt:transform-text($hv,'hexaplaric-variant-seg-to-json.xsl') || "}"
  return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$hexaplaric-variant-as-json}`]``)
};

(:~
 : Returns a list of available hexaplaric variants from a given transcribed manuscript 
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/hexaplaric-variants')
    %rest:produces('application/hal+json')
function hexaplaric-variants:get-list-of-hexaplaric-variants-from-manuscript($manuscript-name as xs:string){
  let $origin := try { request:header("Origin") } catch basex:http {'urn:local'}
  let $manuscript := switch ($manuscript-name)
    case 'vat-gr-754' return 'vat-gr-754-transcription.xml'
    case 'ambr-b-106-sup' return 'ambr-b-106-sup.xml'
    case 'ambr-m-47-sup' return 'ambr-m-47-sup.xml'
    case 'bodl-auct-d-4-1' return 'bodl-auct-d-4-1.xml'
    case 'coislin-10' return 'coislin-10-transcription.xml'
    case 'coislin-12' return 'coislin-12-transcription.xml'
    case 'coislin-187' return 'coislin-187-transcription.xml'
    case 'franzon-3' return 'franzon-3-transcription.xml'
    case 'mosq-syn-194' return 'mosq-syn-194.xml'
    case 'oxon-s-trin-78' return 'oxon-s-trin-78.xml'
    case 'par-gr-139' return 'par-gr-139.xml'
    case 'par-gr-164' return 'par-gr-164-transcription.xml'
    case 'par-gr-166' return 'par-gr-166-transcription.xml'
    case 'plut-5-30' return 'plut-5-30.xml'
    case 'plut-6-3' return 'plut-6-3.xml'
    case 'vat-gr-1422' return 'vat-gr-1422-transcription.xml'
    default return error(xs:QName('response-codes:_404'),'Wrong manuscript name in path')
    let $path := "/psalmcatenae-manuscripts/" || ``[`{$manuscript}`]``
    let $hexaplaric-variant-result-fragment := for $hexaplaric-variant in doc($path)//tei:seg[@type = 'hexaplaric'] return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/hexaplaric-variants/" || $hexaplaric-variant/@xml:id || """}}, ""attribution"" : """ || $hexaplaric-variant/@source || """}"
    let $hexaplaric-variants-as-json-result-fragment := string-join($hexaplaric-variant-result-fragment,',')
    let $hexaplaric-variants-as-json := "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/hexaplaric-variants"" }}, ""_embedded"" : { ""hexaplaric-variants"" : [" || $hexaplaric-variants-as-json-result-fragment || "]}}"
    return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$hexaplaric-variants-as-json}`]``)
};

(:~
 : Return a particular hexaplaric variant of a particular manuscript
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/hexaplaric-variants/{$hexaplaric-variant-id}')
    %rest:produces('application/hal+json')
function hexaplaric-variants:get-hexaplaric-variant-from-manuscript($manuscript-name as xs:string,$hexaplaric-variant-id as xs:string){
  let $origin := try { request:header("Origin") } catch basex:http {'urn:local'}
  let $manuscript := switch ($manuscript-name)
    case 'vat-gr-754' return 'vat-gr-754-transcription.xml'
    case 'ambr-b-106-sup' return 'ambr-b-106-sup.xml'
    case 'ambr-m-47-sup' return 'ambr-m-47-sup.xml'
    case 'bodl-auct-d-4-1' return 'bodl-auct-d-4-1.xml'
    case 'coislin-10' return 'coislin-10-transcription.xml'
    case 'coislin-12' return 'coislin-12-transcription.xml'
    case 'coislin-187' return 'coislin-187-transcription.xml'
    case 'franzon-3' return 'franzon-3-transcription.xml'
    case 'mosq-syn-194' return 'mosq-syn-194.xml'
    case 'oxon-s-trin-78' return 'oxon-s-trin-78.xml'
    case 'par-gr-139' return 'par-gr-139.xml'
    case 'par-gr-164' return 'par-gr-164-transcription.xml'
    case 'par-gr-166' return 'par-gr-166-transcription.xml'
    case 'plut-5-30' return 'plut-5-30.xml'
    case 'plut-6-3' return 'plut-6-3.xml'
    case 'vat-gr-1422' return 'vat-gr-1422-transcription.xml'
    default return error(xs:QName('response-codes:_404'),'Wrong manuscript name in path')
  let $path := "/psalmcatenae-manuscripts/" || ``[`{$manuscript}`]``
  let $corresp := for $hv-referencing in doc($path)//tei:seg[@type = 'hexaplaric'] 
    where $hv-referencing/@xml:id = $hexaplaric-variant-id
    return substring-after($hv-referencing/@corresp,'#')
  let $corresponding-psalm-anchor := for $anchor in doc($path)//tei:anchor[@type = 'psalmtext']
    where $anchor/@xml:id = $corresp
    return $anchor/@xml:id
  let $corresponding-psalm := for $psalm in doc($path)//tei:quote[@type = 'bibletext']
    where $psalm/child::tei:anchor/@xml:id = $corresponding-psalm-anchor
    return $psalm/@xml:id
  let $hexaplaric-variant-as-json := for $hv in doc($path)//tei:seg[@type = 'hexaplaric']
    where $hv/@xml:id = $hexaplaric-variant-id
    return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/hexaplaric-variant/" || $hexaplaric-variant-id || """}, ""psalm"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/psalmtexts/" || $corresponding-psalm || """}}, ""_embedded"" : " || xslt:transform-text($hv,'hexaplaric-variant-seg-to-json.xsl') || " }"
  return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$hexaplaric-variant-as-json}`]``)
};

(:~
 : Returns a list of available hexaplaric variants from a given transcribed manuscript determined by a search parameter 
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/hexaplaric-variants/search')
    %rest:query-param("reference", "{$reference}", '')
    %rest:produces('application/hal+json')
function hexaplaric-variants:get-list-of-hexaplaric-variants-from-manuscript-search($manuscript-name as xs:string,$reference as xs:string){
  let $origin := try { request:header("Origin") } catch basex:http {'urn:local'}
  let $manuscript := switch ($manuscript-name)
    case 'vat-gr-754' return 'vat-gr-754-transcription.xml'
    case 'ambr-b-106-sup' return 'ambr-b-106-sup.xml'
    case 'ambr-m-47-sup' return 'ambr-m-47-sup.xml'
    case 'bodl-auct-d-4-1' return 'bodl-auct-d-4-1.xml'
    case 'coislin-10' return 'coislin-10-transcription.xml'
    case 'coislin-12' return 'coislin-12-transcription.xml'
    case 'coislin-187' return 'coislin-187-transcription.xml'
    case 'franzon-3' return 'franzon-3-transcription.xml'
    case 'mosq-syn-194' return 'mosq-syn-194.xml'
    case 'oxon-s-trin-78' return 'oxon-s-trin-78.xml'
    case 'par-gr-139' return 'par-gr-139.xml'
    case 'par-gr-164' return 'par-gr-164-transcription.xml'
    case 'par-gr-166' return 'par-gr-166-transcription.xml'
    case 'plut-5-30' return 'plut-5-30.xml'
    case 'plut-6-3' return 'plut-6-3.xml'
    case 'vat-gr-1422' return 'vat-gr-1422-transcription.xml'
    default return error(xs:QName('response-codes:_404'),'Wrong manuscript name in path')
    let $path := "/psalmcatenae-manuscripts/" || ``[`{$manuscript}`]``
    let $hexaplaric-variants-result-fragment := for $hexaplaric-variant in doc($path)//tei:seg[@type = 'hexaplaric'] 
       let $reference-of-hexaplaric-variant := substring-after($hexaplaric-variant/@corresp,'#')
       let $references-from-source := for $psalmtext in doc($path)//tei:quote[@type = 'bibletext'] 
         where $psalmtext/@n = $reference
         return $psalmtext/child::tei:anchor[@type = 'psalmtext']/@xml:id
       where 
         if ($reference != '') then ($reference-of-hexaplaric-variant = $references-from-source) else (1 = 1) 
       return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/hexaplaric-variants/" || $hexaplaric-variant/@xml:id || """}}, ""critical-attribution"" : """ || $hexaplaric-variant/@source || """}"
    let $hexaplaric-variants-as-json-result-fragment := string-join($hexaplaric-variants-result-fragment,',')
    let $hexaplaric-variants-as-json := "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/hexaplaric-variants/search"" }}, ""_embedded"" : { ""hexaplaric-variants"" : [" || $hexaplaric-variants-as-json-result-fragment || "]}}"
    return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$hexaplaric-variants-as-json}`]``)
  };

declare %private function hexaplaric-variants:write-log($message as xs:string, $severity as xs:string) {
  if ($hexaplaric-variants:enable-trace) then admin:write-log($message, $severity) else ()
};

declare %private function hexaplaric-variants:write-log($message as xs:string) {
  if ($hexaplaric-variants:enable-trace) then admin:write-log($message, "INFO") else ()
};