(:~
 : API for querying psalmcatenae manuscripts for commentaryfragments, glosses, hexaplaric variants, and psalmtexts.
 :)
xquery version "3.1";

module namespace references = 'https://psalmcatenae.acdh-dev.oeaw.ac.at/psalmcatenae-server/references';

import module namespace admin = "http://basex.org/modules/admin";
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace request = "http://exquery.org/ns/request";

declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare variable $references:enable-trace := true();

(:~
 : Returns a list of references of psalmtexts for which one or more commentaryfragments exist in a given manuscript.
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/references')
    %rest:produces('application/hal+json')
function references:get-references-of-manuscript($manuscript-name as xs:string){
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
    let $anchors-of-commentaryfragments := for $commentaryfragment in doc($path)//tei:seg[@type = 'commentaryfragment'] return substring-after($commentaryfragment/@corresp,'#')
    let $anchors-with-commentaryfragments := for $anchor in doc($path)//tei:quote[@type = 'bibletext']/tei:anchor[@type = 'psalmtext'] where $anchor/@xml:id = $anchors-of-commentaryfragments return $anchor/@xml:id
    let $psalmtexts-with-commentaryfragments := for $psalmtext in doc($path)//tei:quote[@type = 'bibletext'] where $psalmtext/tei:anchor[@type = 'psalmtext']/@xml:id = $anchors-with-commentaryfragments return "{ ""id"" : """ || $psalmtext/@xml:id || """, ""psalmverse"" : """ || $psalmtext/@n || """}"
    let $psalmtexts-with-commentaryfragments-json-fragment := string-join($psalmtexts-with-commentaryfragments,',')
    let $references-as-json := "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/references"" }}, ""_embedded"" : { ""references"" : [" || $psalmtexts-with-commentaryfragments-json-fragment || "]}}"
    return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$references-as-json}`]``)
};

declare %private function references:write-log($message as xs:string, $severity as xs:string) {
  if ($references:enable-trace) then admin:write-log($message, $severity) else ()
};

declare %private function references:write-log($message as xs:string) {
  if ($references:enable-trace) then admin:write-log($message, "TRACE") else ()
};