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

(:~
 : Returns a list of available glosses from a given transcribed manuscript determined by search parameters 
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/glosses/search')
    %rest:query-param("author", "{$author}", '')
    %rest:query-param("author-critical", "{$author-critical}", '')
    %rest:query-param("reference", "{$reference}", '')
    %rest:query-param("reference-from", "{$reference-from}","empty")
    %rest:query-param("reference-to", "{$reference-to}","empty")
    %rest:produces('application/hal+json')
function glosses:get-list-of-glosses-from-manuscript-search($manuscript-name as xs:string,$author as xs:string,$author-critical as xs:string,$reference as xs:string,$reference-from as xs:string,$reference-to as xs:string){
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
    let $reference-from-prepared := glosses:prepare-reference-from($path,$reference-from)
    let $reference-to-prepared := glosses:prepare-reference-to($path,$reference-to)
    let $references-in-range := glosses:get-references-in-range($path,$reference-from-prepared,$reference-to-prepared)
    let $glosses-result-fragment := for $gloss in doc($path)//tei:seg[@type = 'glosse'] 
       let $author-from-source := $gloss/@source
       let $author-critical-from-source := substring-after($gloss/child::tei:quote[@type = 'patristic']/@corresp,'#')
       let $author-critical-id := for $author in doc($path)//tei:listPerson/tei:person[@role = 'author'] where if (exists($author/child::tei:bibl)) then (concat($author/child::tei:persName/text(),' - ',$author/child::tei:bibl/text()) = $author-critical) else ($author/child::tei:persName/text() = $author-critical) return $author/@xml:id
       let $reference-of-gloss := substring-after($gloss/@corresp,'#')
       let $references-from-source := for $psalmtext in doc($path)//tei:quote[@type = 'bibletext'] 
         where $psalmtext/@n = $reference
         return $psalmtext/child::tei:anchor[@type = 'psalmtext']/@xml:id
       where 
         if ($author != '') then if ($author-critical != '') then if ($reference != '') then ($author-from-source = $author) and ($author-critical-from-source = $author-critical-id) and ($reference-of-gloss = $references-from-source) 
         else ($author-from-source = $author) and ($author-critical-from-source = $author-critical-id) and ($reference-of-gloss = $references-in-range)
         else if ($reference != '') then ($reference-of-gloss = $references-from-source) and ($author-from-source = $author) 
         else ($author-from-source = $author) and ($reference-of-gloss = $references-in-range)
         else if ($author-critical != '') then if ($reference != '') then ($author-critical-from-source = $author-critical-id) and ($reference-of-gloss = $references-from-source) 
         else ($author-critical-from-source = $author-critical-id) and ($reference-of-gloss = $references-in-range)
         else if ($reference != '') then ($reference-of-gloss = $references-from-source) 
         else ($reference-of-gloss = $references-in-range)
       return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/glosses/" || $gloss/@xml:id || """}}, ""attribution"" : """ || $gloss/@source ||""", ""author-critical"" : """ || $gloss/child::tei:quote[@type = 'patristic']/@source || """}"
    let $glosses-as-json-result-fragment := string-join($glosses-result-fragment,',')
    let $glosses-as-json := "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/glosses/search"" }}, ""_embedded"" : { ""glosses"" : [" || $glosses-as-json-result-fragment || "]}}"
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

declare %private function glosses:get-references-in-range($path as xs:string,$psalmverse-from as xs:string,$psalmverse-to as xs:string){
  let $references-in-range := for $psalmtext in doc($path)//tei:quote[@type = 'bibletext']
    where glosses:is-psalmverse-in-range(substring-after($psalmtext/@n,'Ps (LXX) '),$psalmverse-from,$psalmverse-to)
    return $psalmtext/child::tei:anchor[@type = 'psalmtext']/@xml:id
  return $references-in-range
};

declare %private function glosses:prepare-reference-from($path as xs:string,$psalmverse-from as xs:string){
  let $result := if ($psalmverse-from = 'empty') then (glosses:get-min-value-for-reference($path))
    else (substring-after($psalmverse-from,'Ps (LXX) '))
  return $result
};

declare %private function glosses:prepare-reference-to($path as xs:string,$psalmverse-to as xs:string){
  let $result := if ($psalmverse-to = 'empty') then (glosses:get-max-value-for-reference($path))
    else (substring-after($psalmverse-to,'Ps (LXX) '))
  return $result
};

declare %private function glosses:get-min-value-for-reference($path as xs:string){
  let $min-value := (doc($path)//tei:quote[@type = 'bibletext'])[1]/@n
  return (substring-after($min-value,'Ps (LXX) '))
};

declare %private function glosses:get-max-value-for-reference($path as xs:string){
  let $max-value := (doc($path)//tei:quote[@type = 'bibletext'])[last()]/@n
  return (substring-after($max-value,'Ps (LXX) '))
};

declare %private function glosses:is-psalmverse-in-range($psalmverse as xs:string,$psalmverse-from as xs:string,$psalmverse-to as xs:string){
  let $psalm := number(substring-before($psalmverse,','))
  let $verse := number(substring-after($psalmverse,','))
  let $psalm-from := number(substring-before($psalmverse-from,','))
  let $verse-from := number(substring-after($psalmverse-from,','))
  let $psalm-to := number(substring-before($psalmverse-to,','))
  let $verse-to := number(substring-after($psalmverse-to,','))
  let $result :=  if (($psalm lt $psalm-from) or ($psalm gt $psalm-to)) then (false())
     else (: lower limit <= value <= upper limit:) if (($psalm = $psalm-from) and ($verse lt $verse-from)) then (false())
     else if (($psalm = $psalm-to) and ($verse gt $verse-to)) then (false()) else (true())
  return $result
};

declare %private function glosses:write-log($message as xs:string, $severity as xs:string) {
  if ($glosses:enable-trace) then admin:write-log($message, $severity) else ()
};

declare %private function glosses:write-log($message as xs:string) {
  if ($glosses:enable-trace) then admin:write-log($message, "INFO") else ()
};