(:~
 : API for querying psalmcatenae manuscripts for commentaryfragments, glosses, hexaplaric variants, and psalmtexts.
 :)
xquery version "3.1";

module namespace psalmtexts = 'https://psalmcatenae.acdh-dev.oeaw.ac.at/psalmcatenae-server/psalmtexts';

import module namespace admin = "http://basex.org/modules/admin";
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace request = "http://exquery.org/ns/request";

declare namespace tei = "http://www.tei-c.org/ns/1.0";

declare variable $psalmtexts:enable-trace := true();

(:~
 : Returns a list of available psalmtexts from all transcribed manuscripts
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/psalmtexts')
    %rest:produces('application/hal+json')
function psalmtexts:get-list-of-psalmtexts(){};

(:~
 : Returns a particular psalmtext.
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/psalmtexts/{$psalmtext-id}')
    %rest:produces('application/hal+json')
function psalmtexts:get-psalmtext($psalmtext-id as xs:string){};

(:~
 : Returns a list of available psalmtexts from a given transcribed manuscript 
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/psalmtexts')
    %rest:produces('application/hal+json')
function psalmtexts:get-list-of-psalmtexts-from-manuscript($manuscript-name as xs:string){
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
    let $psalmtexts-result-fragment := for $psalmtext in doc($path)//tei:quote[@type = 'bibletext'] return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/psalmtexts/" || $psalmtext/@xml:id || """}}, ""psalmverse"" : """ || $psalmtext/@n || """}"
    let $psalmtexts-as-json-result-fragment := string-join($psalmtexts-result-fragment,',')
    let $psalmtexts-as-json := "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/psalmtexts"" }}, ""_embedded"" : { ""psalmtexts"" : [" || $psalmtexts-as-json-result-fragment || "]}}"
    return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$psalmtexts-as-json}`]``)
};

(:~
 : Return a particular psalmtext of a particular manuscript
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/psalmtexts/{$psalmtext-id}')
    %rest:produces('application/hal+json')
function psalmtexts:get-psalmtext-from-manuscript($manuscript-name as xs:string,$psalmtext-id as xs:string){
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
  let $psalmtext-as-json := for $psalmverse in doc($path)//tei:quote[@type = 'bibletext']
    where $psalmverse/@xml:id = $psalmtext-id
    return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/manuscripts/" || $manuscript-name || "/psalmtexts/" || $psalmtext-id || """}, ""_embedded"" : " || xslt:transform-text($psalmverse,'psalmtext-quote-to-json.xsl') || "}}"
  return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$psalmtext-as-json}`]``)
};

declare %private function psalmtexts:write-log($message as xs:string, $severity as xs:string) {
  if ($psalmtexts:enable-trace) then admin:write-log($message, $severity) else ()
};

declare %private function psalmtexts:write-log($message as xs:string) {
  if ($psalmtexts:enable-trace) then admin:write-log($message, "TRACE") else ()
};