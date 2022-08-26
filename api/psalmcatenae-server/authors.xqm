(:~
 : API for querying psalmcatenae manuscripts for commentaryfragments, glosses, hexaplaric variants, and psalmtexts.
 :)
xquery version "3.1";

module namespace authors = 'https://psalmcatenae.acdh-dev.oeaw.ac.at/psalmcatenae-server/authors';

import module namespace admin = "http://basex.org/modules/admin";
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace request = "http://exquery.org/ns/request";
import module namespace xslt = "http://basex.org/modules/xslt";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace response-codes = "https://tools.ietf.org/html/rfc7231#section-6";

declare variable $authors:enable-trace := true();

(:~
 : Returns a list of authors of commentaryfragments in a given manuscript
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/authors')
    %rest:produces('application/hal+json')
function authors:get-authors-of-manuscript($manuscript-name as xs:string){
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
    let $author-result-fragment := for $commentaryfragment in doc($path)//tei:seg[@type = 'commentaryfragment'] return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/authors"" }, ""commentaryfragment"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/commentaryfragments/" || $commentaryfragment/@xml:id || """}}, ""author"" : """ || $commentaryfragment/@source || """}"
    let $authors-as-json-result-fragment := string-join($author-result-fragment,',')
    let $authors-as-json := "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/authors"" }}, ""_embedded"" : { ""authors"" : [" || $authors-as-json-result-fragment || "]}}"
    return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$authors-as-json}`]``)
};

(:~
 : Returns a list of distinct authors of commentaryfragments in a given manuscript
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/authors-distinct')
    %rest:produces('application/hal+json')
function authors:get-authors-distinct-of-manuscript($manuscript-name as xs:string){
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
    let $author-result-fragment := for $author in distinct-values(doc($path)//tei:seg[@type = 'commentaryfragment']/@source) return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/authors-distinct"" }}, ""author"" : """ || $author || """}"
    let $authors-as-json-result-fragment := string-join($author-result-fragment,',')
    let $authors-as-json := "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/authors-distinct"" }}, ""_embedded"" : { ""authors"" : [" || $authors-as-json-result-fragment || "]}}"
    return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$authors-as-json}`]``)
};

declare %private function authors:write-log($message as xs:string, $severity as xs:string) {
  if ($authors:enable-trace) then admin:write-log($message, $severity) else ()
};

declare %private function authors:write-log($message as xs:string) {
  if ($authors:enable-trace) then admin:write-log($message, "TRACE") else ()
};