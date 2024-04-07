(:~
 : API for querying psalmcatenae manuscripts for commentaryfragments, glosses, hexaplaric variants, and psalmtexts.
 :)
xquery version "3.1";

module namespace commentaryfragments = 'https://psalmcatenae.acdh-dev.oeaw.ac.at/psalmcatenae-server/commentaryfragments';

import module namespace admin = "http://basex.org/modules/admin";
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace request = "http://exquery.org/ns/request";
import module namespace xslt = "http://basex.org/modules/xslt";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace response-codes = "https://tools.ietf.org/html/rfc7231#section-6";

declare variable $commentaryfragments:enable-trace := true();

(:~
 : Returns a list of available commentaryfragments from all transcribed manuscripts
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/commentaryfragments')
    %rest:produces('application/hal+json')
function commentaryfragments:get-list-of-commentaryfragments(){
  let $origin := try { request:header("Origin") } catch basex:http {'urn:local'}
  let $path := "/psalmcatenae-manuscripts"
  let $commentaryfragments-result-fragment := for $commentaryfragment in collection($path)//tei:seg[(@type = 'commentaryfragment') or (@type = 'hypothesis')] return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/commentaryfragments/" || $commentaryfragment/@xml:id || """}}, ""attribution"" : """ || $commentaryfragment/@source ||""", ""author-critical"" : """ || $commentaryfragment/child::tei:quote[@type = 'patristic']/@source || """}"
  let $commentaryfragments-as-json-result-fragment := string-join($commentaryfragments-result-fragment,',')
  let $commentaryfragments-as-json := "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/commentaryfragments"" }}, ""_embedded"" : { ""commentaryfragments"" : [" || $commentaryfragments-as-json-result-fragment || "]}}"
    return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$commentaryfragments-as-json}`]``)
};

(:~
 : Returns a particular commentaryfragment
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/commentaryfragments/{$commentaryfragment-id}')
    %rest:produces('application/hal+json')
function commentaryfragments:get-commentaryfragment($commentaryfragment-id as xs:string){
  let $origin := try { request:header("Origin") } catch basex:http {'urn:local'}
  let $path := "/psalmcatenae-manuscripts"
  let $corresp := for $cf-referencing in collection($path)//tei:seg[(@type = 'commentaryfragment') or (@type = 'hypothesis')] 
    where $cf-referencing/@xml:id = $commentaryfragment-id
    return substring-after($cf-referencing/@corresp,'#')
  let $corresponding-psalm-anchor := for $anchor in collection($path)//tei:anchor[@type = 'psalmtext']
    where $anchor/@xml:id = $corresp
    return $anchor/@xml:id
  let $corresponding-psalm := for $psalm in collection($path)//tei:quote[@type = 'bibletext']
    where $psalm/child::tei:anchor/@xml:id = $corresponding-psalm-anchor
    return $psalm/@xml:id
  let $previous-commentaryfragment := for $actual-commentaryfragment in collection($path)//tei:seg[(@type = 'commentaryfragment') or (@type = 'hypothesis')]
    where $actual-commentaryfragment/@xml:id = $commentaryfragment-id
    return if (not(empty($actual-commentaryfragment/@prev))) then ", ""prev"" : { ""href"" : ""/psalmcatenae-server/commentaryfragments/" || substring-after($actual-commentaryfragment/@prev,'#') || """ }," else ()
  let $next-commentaryfragment := for $actual-commentaryfragment in collection($path)//tei:seg[(@type = 'commentaryfragment') or (@type = 'hypothesis')]
    where $actual-commentaryfragment/@xml:id = $commentaryfragment-id
    return if (not(empty($actual-commentaryfragment/@next))) then ", ""next"" : { ""href"" : ""/psalmcatenae-server/commentaryfragments/" || substring-after($actual-commentaryfragment/@next,'#') || """ }," else ()
  let $commentaryfragment-as-json := for $cf in collection($path)//tei:seg[(@type = 'commentaryfragment') or (@type = 'hypothesis')]
    where $cf/@xml:id = $commentaryfragment-id
    return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/commentaryfragments/" || $commentaryfragment-id || """}, ""psalm"" : { ""href"" : ""/psalmcatenae-server/psalmtexts/" || $corresponding-psalm || """}, ""manuscript"" : { ""manuscript-identifier"" : """ || normalize-space(root($cf)/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno/text()) || """, ""href"" : ""/psalmcatenae-server/manuscripts/" || ``[`{switch(db:path($cf)) case 'oxon-s-trin-78.xml' return 'oxon-s-trin-78'  case 'vat-gr-754-transcription.xml' return 'vat-gr-754' case 'ambr-b-106-sup.xml' return 'ambr-b-106-sup' case 'ambr-m-47-sup.xml' return 'ambr-m-47-sup' case 'athen-b-n-8.xml' return 'athen-b-n-8' case 'bodl-auct-d-4-1.xml' return 'bodl-auct-d-4-1' case 'coislin-10-transcription.xml' return 'coislin-10' case 'coislin-12-transcription.xml' return 'coislin-12' case 'franzon-3-transcription.xml' return 'franzon-3.xml' case 'mosq-syn-194.xml' return 'mosq-syn-194' case 'par-gr-139.xml' return 'par-gr-139' case 'par-gr-164-transcription.xml' return 'par-gr-164' case 'par-gr-166-transcription.xml' return 'par-gr-166' case 'plut-5-30.xml' return 'plut-5-30' case 'plut-6-3.xml' return 'plut-6-3' case 'vat-gr-1422-transcription.xml' return 'vat-gr-1422' default return ""}`]`` || """}" || $previous-commentaryfragment || $next-commentaryfragment || "}, ""_embedded"" : " || xslt:transform-text($cf,'commentaryfragment-seg-to-json.xsl') || " }"
  return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$commentaryfragment-as-json}`]``)
};

(:~
 : Returns a list of available commentaryfragments from a given transcribed manuscript 
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/commentaryfragments')
    %rest:produces('application/hal+json')
function commentaryfragments:get-list-of-commentaryfragments-from-manuscript($manuscript-name as xs:string){
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
    let $commentaryfragments-result-fragment := for $commentaryfragment in doc($path)//tei:seg[(@type = 'commentaryfragment') or (@type = 'hypothesis')] 
      return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/commentaryfragments/" || $commentaryfragment/@xml:id || """}}, ""attribution"" : """ || $commentaryfragment/@source ||""", ""author-critical"" : """ || $commentaryfragment/child::tei:quote[@type = 'patristic']/@source || """}"
    let $commentaryfragments-as-json-result-fragment := string-join($commentaryfragments-result-fragment,',')
    let $commentaryfragments-as-json := "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/commentaryfragments"" }}, ""_embedded"" : { ""commentaryfragments"" : [" || $commentaryfragments-as-json-result-fragment || "]}}"
    return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$commentaryfragments-as-json}`]``)
  };
  
  (:~
 : Returns a list of available commentaryfragments from a given transcribed manuscript 
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/commentaryfragments/search')
    %rest:query-param("author", "{$author}", '')
    %rest:query-param("author-critical", "{$author-critical}", '')
    %rest:query-param("reference", "{$reference}", '')
    %rest:produces('application/hal+json')
function commentaryfragments:get-list-of-commentaryfragments-from-manuscript-search($manuscript-name as xs:string,$author as xs:string,$author-critical as xs:string,$reference as xs:string){
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
    let $commentaryfragments-result-fragment := for $commentaryfragment in doc($path)//tei:seg[(@type = 'commentaryfragment') or (@type = 'hypothesis')] 
       let $author-from-source := $commentaryfragment/@source
       let $author-critical-from-source := $commentaryfragment/child::tei:quote[@type = 'patristic']/@source
       let $reference-of-commentaryfragment := substring-after($commentaryfragment/@corresp,'#')
       let $references-from-source := for $psalmtext in doc($path)//tei:quote[@type = 'bibletext'] 
         where $psalmtext/@n = $reference
         return $psalmtext/child::tei:anchor[@type = 'psalmtext']/@xml:id
       where 
         if ($author != '') then if ($author-critical != '') then if ($reference != '') then ($author-from-source = $author) and ($author-critical-from-source = $author-critical) and ($reference-of-commentaryfragment = $references-from-source) 
                                                                  else ($author-from-source = $author) and ($author-critical-from-source = $author-critical) 
                                 else if ($reference != '') then ($reference-of-commentaryfragment = $references-from-source) and ($author-from-source = $author)         else ($author-from-source = $author) 
         else if ($author-critical != '') then if ($reference != '') then ($author-critical-from-source = $author-critical) and ($reference-of-commentaryfragment = $references-from-source) 
                                               else ($author-critical-from-source = $author-critical)
              else if ($reference != '') then ($reference-of-commentaryfragment = $references-from-source) else (1 = 1) 
       return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/commentaryfragments/" || $commentaryfragment/@xml:id || """}}, ""attribution"" : """ || $commentaryfragment/@source ||""", ""author-critical"" : """ || $commentaryfragment/child::tei:quote[@type = 'patristic']/@source || """}"
    let $commentaryfragments-as-json-result-fragment := string-join($commentaryfragments-result-fragment,',')
    let $commentaryfragments-as-json := "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/commentaryfragments/search"" }}, ""_embedded"" : { ""commentaryfragments"" : [" || $commentaryfragments-as-json-result-fragment || "]}}"
    return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$commentaryfragments-as-json}`]``)
  };
  
(:~
 : Return a particular commentaryfragment of a particular manuscript
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/commentaryfragments/{$commentaryfragment-id}')
    %rest:produces('application/hal+json')
    %output:media-type("application/hal+json")
function commentaryfragments:get-commentaryfragment-from-manuscript($manuscript-name as xs:string,$commentaryfragment-id as xs:string){
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
  let $corresp := for $cf-referencing in doc($path)//tei:seg[(@type = 'commentaryfragment') or (@type = 'hypothesis')] 
    where $cf-referencing/@xml:id = $commentaryfragment-id
    return substring-after($cf-referencing/@corresp,'#')
  let $corresponding-psalm-anchor := for $anchor in doc($path)//tei:anchor[@type = 'psalmtext']
    where $anchor/@xml:id = $corresp
    return $anchor/@xml:id
  let $corresponding-psalm := for $psalm in doc($path)//tei:quote[@type = 'bibletext']
    where $psalm/child::tei:anchor/@xml:id = $corresponding-psalm-anchor
    return $psalm/@xml:id
  let $previous-commentaryfragment := for $actual-commentaryfragment in doc($path)//tei:seg[(@type = 'commentaryfragment') or (@type = 'hypothesis')]
    where $actual-commentaryfragment/@xml:id = $commentaryfragment-id
    return if (not(empty($actual-commentaryfragment/@prev))) then ", ""prev"" : { ""href"" : ""/psalmcatenae-server/" || $manuscript-name || "/commentaryfragments/" || substring-after($actual-commentaryfragment/@prev,'#') || """}" else ()
  let $next-commentaryfragment := for $actual-commentaryfragment in doc($path)//tei:seg[(@type = 'commentaryfragment') or (@type = 'hypothesis')]
    where $actual-commentaryfragment/@xml:id = $commentaryfragment-id
    return if (not(empty($actual-commentaryfragment/@next))) then ", ""next"" : { ""href"" : ""/psalmcatenae-server/" || $manuscript-name || "/commentaryfragments/" || substring-after($actual-commentaryfragment/@next,'#') || """}" else ()
  let $commentaryfragment-as-json := for $cf in doc($path)//tei:seg[(@type = 'commentaryfragment') or (@type = 'hypothesis')]
    where $cf/@xml:id = $commentaryfragment-id
    return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/commentaryfragments/" || $commentaryfragment-id || """}, ""psalm"" : { ""href"" : ""/psalmcatenae-server/" || $manuscript-name || "/psalmtexts/" || $corresponding-psalm || """}, ""manuscript"" : { ""manuscript-identifier"" : """ || normalize-space(root($cf)/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno/text()) || """, ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || """}" || $previous-commentaryfragment || "}" || $next-commentaryfragment || ", ""_embedded"" : " || xslt:transform-text($cf,'commentaryfragment-seg-to-json.xsl') || " }"
  return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$commentaryfragment-as-json}`]``)
};

declare %private function commentaryfragments:write-log($message as xs:string, $severity as xs:string) {
  if ($commentaryfragments:enable-trace) then admin:write-log($message, $severity) else ()
};

declare %private function commentaryfragments:write-log($message as xs:string) {
  if ($commentaryfragments:enable-trace) then admin:write-log($message, "TRACE") else ()
};