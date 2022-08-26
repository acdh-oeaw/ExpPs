(:~
 : API for querying psalmcatenae manuscripts for commentaryfragments, glosses, hexaplaric variants, and psalmtexts.
 :)
xquery version "3.1";

module namespace glosses = 'https://psalmcatenae.acdh-dev.oeaw.ac.at/psalmcatenae-server/glosses';

import module namespace admin = "http://basex.org/modules/admin";
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace request = "http://exquery.org/ns/request";
import module namespace xslt = "http://basex.org/modules/xslt";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace response-codes = "https://tools.ietf.org/html/rfc7231#section-6";

declare variable $glosses:enable-trace := true();

(:~
 : Returns a list of available glosses from all transcribed manuscripts
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/glosses')
    %rest:produces('application/hal+json')
function glosses:get-list-of-glosses(){
  let $origin := try { request:header("Origin") } catch basex:http {'urn:local'}
  let $path := "/psalmcatenae-manuscripts"
  let $glosses-result-fragment := for $gloss in collection($path)//tei:seg[@type = 'glosse'] return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/glosses/" || $gloss/@xml:id || """}}, ""attribution"" : """ || $gloss/@source ||""", ""author-critical"" : """ || $gloss/child::tei:quote/@source || """}"
  let $glosses-as-json-result-fragment := string-join($glosses-result-fragment,',')
  let $glosses-as-json := "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/glosses"" }}, ""_embedded"" : { ""glosses"" : [" || $glosses-as-json-result-fragment || "]}}"
    return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$glosses-as-json}`]``)
};

(:~
 : Returns a particular gloss.
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/glosses/{$gloss-id}')
    %rest:produces('application/hal+json')
function glosses:get-gloss($gloss-id as xs:string){
  let $origin := try { request:header("Origin") } catch basex:http {'urn:local'}
  let $path := "/psalmcatenae-manuscripts"
  let $corresp := for $g-referencing in collection($path)//tei:seg[@type = 'glosse'] 
    where $g-referencing/@xml:id = $gloss-id
    return substring-after($g-referencing/@corresp,'#')
  let $corresponding-psalm-anchor := for $anchor in collection($path)//tei:anchor[@type = 'psalmtext']
    where $anchor/@xml:id = $corresp
    return $anchor/@xml:id
  let $corresponding-psalm := for $psalm in collection($path)//tei:quote[@type = 'bibletext']
    where $psalm/child::tei:anchor/@xml:id = $corresponding-psalm-anchor
    return $psalm/@xml:id
  let $gloss-as-json := for $g in collection($path)//tei:seg[@type = 'glosse']
    where $g/@xml:id = $gloss-id
    return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/glosses/" || $gloss-id || """}, ""psalm"" : { ""href"" : ""/psalmcatenae-server/psalmtexts/" || $corresponding-psalm || """}}, ""_embedded"" : " || xslt:transform-text($g,'glosse-seg-to-json.xsl') || "}"
  return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$gloss-as-json}`]``)
};

(:~
 : Returns a list of available glosses from a given transcribed manuscript 
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/glosses')
    %rest:produces('application/hal+json')
function glosses:get-list-of-glosses-from-manuscript($manuscript-name as xs:string){
  let $origin := try { request:header("Origin") } catch basex:http {'urn:local'}
  let $manuscript := switch ($manuscript-name)
    case 'vat-gr-754' return 'vat-gr-754-transcription.xml'
    case 'ambr-b-106-sup' return 'ambr-b-106-sup.xml'
    case 'ambr-m-47-sup' return 'ambr-m-47-sup.xml'
    case 'athen-b-n-8' return 'athen-b-n-8.xml'
    case 'bodl-auct-d-4-1' return 'bodl-auct-d-4-1.xml'
    case 'coislin-10' return 'coislin-10-transcription.xml'
    case 'coislin-12' return 'coislin-12-transcription.xml'
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
    let $glosses-result-fragment := for $gloss in doc($path)//tei:seg[@type = 'glosse'] return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/glosses/" || $gloss/@xml:id || """}}, ""attribution"" : """ || $gloss/@source ||""", ""author-critical"" : """ || $gloss/child::tei:quote/@source || """}"
    let $glosses-as-json-result-fragment := string-join($glosses-result-fragment,',')
    let $glosses-as-json := "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/glosses"" }}, ""_embedded"" : { ""glosses"" : [" || $glosses-as-json-result-fragment || "]}}"
    return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$glosses-as-json}`]``)
};

(:~
 : Return a particular gloss of a particular manuscript
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/glosses/{$gloss-id}')
    %rest:produces('application/hal+json')
function glosses:get-gloss-from-manuscript($manuscript-name as xs:string,$gloss-id as xs:string){
  let $origin := try { request:header("Origin") } catch basex:http {'urn:local'}
  let $manuscript := switch ($manuscript-name)
    case 'vat-gr-754' return 'vat-gr-754-transcription.xml'
    case 'ambr-b-106-sup' return 'ambr-b-106-sup.xml'
    case 'ambr-m-47-sup' return 'ambr-m-47-sup.xml'
    case 'athen-b-n-8' return 'athen-b-n-8.xml'
    case 'bodl-auct-d-4-1' return 'bodl-auct-d-4-1.xml'
    case 'coislin-10' return 'coislin-10-transcription.xml'
    case 'coislin-12' return 'coislin-12-transcription.xml'
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
  let $corresp := for $g-referencing in doc($path)//tei:seg[@type = 'glosse'] 
    where $g-referencing/@xml:id = $gloss-id
    return substring-after($g-referencing/@corresp,'#')
  let $corresponding-psalm-anchor := for $anchor in doc($path)//tei:anchor[@type = 'psalmtext']
    where $anchor/@xml:id = $corresp
    return $anchor/@xml:id
  let $corresponding-psalm := for $psalm in doc($path)//tei:quote[@type = 'bibletext']
    where $psalm/child::tei:anchor/@xml:id = $corresponding-psalm-anchor
    return $psalm/@xml:id
  let $gloss-as-json := for $g in doc($path)//tei:seg[@type = 'glosse']
    where $g/@xml:id = $gloss-id
    return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/" || $manuscript-name || "/glosses/" || $gloss-id || """}, ""psalm"" : { ""href"" : ""/psalmcatenae-server/" || $manuscript-name || "/psalmtexts/" || $corresponding-psalm || """}}, ""_embedded"" : " || xslt:transform-text($g,'glosse-seg-to-json.xsl') || "}"
  return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$gloss-as-json}`]``)
};

declare %private function glosses:write-log($message as xs:string, $severity as xs:string) {
  if ($glosses:enable-trace) then admin:write-log($message, $severity) else ()
};

declare %private function glosses:write-log($message as xs:string) {
  if ($glosses:enable-trace) then admin:write-log($message, "INFO") else ()
};