(:~
 : API for querying psalmcatenae manuscripts for commentaryfragments, glosses, hexaplaric variants, and psalmtexts.
 :)
xquery version "3.1";

module namespace fulltextsearch = 'https://psalmcatenae.acdh-dev.oeaw.ac.at/psalmcatenae-server/fulltextsearch';

import module namespace admin = "http://basex.org/modules/admin";
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace request = "http://exquery.org/ns/request";
import module namespace xslt = "http://basex.org/modules/xslt";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace response-codes = "https://tools.ietf.org/html/rfc7231#section-6";

(:~
 : Returns a list of segments from all manuscripts containing the search string
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/search')
    %rest:query-param("searchstring", "{$searchstring}", '')
    %rest:produces('application/hal+json')
function fulltextsearch:get-list-of-segments-from-manuscripts-search($searchstring as xs:string){
  let $origin := try { request:header("Origin") } catch basex:http {'urn:local'}
  let $path := "/psalmcatenae-manuscripts"
  let $segments-as-json-result-fragment := for $segment in collection($path)//tei:seg[(@type = 'commentaryfragment') or (@type = 'hypothesis') or (@type = 'hexaplaric') or (@type = 'glosse')]
    where $segment[. contains text {$searchstring} using stemming using language 'Greek']
    return switch($segment/@type) 
    case 'hypothesis' return "{ ""_links"" : { ""self"" :  { ""href"" : ""/psalmcatenae-server/manuscripts/" || ``[`{switch(db:path($segment)) case 'oxon-s-trin-78.xml' return 'oxon-s-trin-78'  case 'vat-gr-754-transcription.xml' return 'vat-gr-754' case 'ambr-b-106-sup.xml' return 'ambr-b-106-sup' case 'ambr-m-47-sup.xml' return 'ambr-m-47-sup' case 'coislin-187-transcription.xml' return 'coislin-187' case 'bodl-auct-d-4-1.xml' return 'bodl-auct-d-4-1' case 'coislin-10-transcription.xml' return 'coislin-10' case 'coislin-12-transcription.xml' return 'coislin-12' case 'franzon-3-transcription.xml' return 'franzon-3' case 'mosq-syn-194.xml' return 'mosq-syn-194' case 'par-gr-139.xml' return 'par-gr-139' case 'par-gr-164-transcription.xml' return 'par-gr-164' case 'par-gr-166-transcription.xml' return 'par-gr-166' case 'plut-5-30.xml' return 'plut-5-30' case 'plut-6-3.xml' return 'plut-6-3' case 'vat-gr-1422-transcription.xml' return 'vat-gr-1422' default return ""}`]`` || "/commentaryfragments/" || $segment/@xml:id || """}, ""transcription"" : { ""href"" : ""https://expps.acdh-dev.oeaw.ac.at/expps/manuscripts/" 
    || ``[`{switch(db:path($segment)) case 'oxon-s-trin-78.xml' return 'oxon_s_trin_78.html'  case 'vat-gr-754-transcription.xml' return 'vat_gr_754.html' case 'ambr-b-106-sup.xml' return 'ambr_b_106_sup.html' case 'ambr-m-47-sup.xml' return 'ambr_m_47_sup.html' case 'coislin-187-transcription.xml' return 'coislin-187.html' case 'bodl-auct-d-4-1.xml' return 'bodl_auct_d_4_1.html' case 'coislin-10-transcription.xml' return 'coislin_10.html' case 'coislin-12-transcription.xml' return 'coislin_12.html' case 'franzon-3-transcription.xml' return 'franzon_3.html' case 'mosq-syn-194.xml' return 'mosq_synod_194.html' case 'par-gr-139.xml' return 'par_gr_139.html' case 'par-gr-164-transcription.xml' return 'par_gr_164.html' case 'par-gr-166-transcription.xml' return 'par_gr_166.html' case 'plut-5-30.xml' return 'plut_5_30.html' case 'plut-6-3.xml' return 'plut_6_3.html' case 'vat-gr-1422-transcription.xml' return 'vat_gr_1422.html' default return ""}`]`` 
    || "#" || $segment/@xml:id || """}}, ""_embedded"" : { ""type"" : ""commentaryfragment"", ""manuscript"" : { ""manuscriptIdentifier"" : """ || normalize-space(root($segment)/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno/text()) || """}, ""data"" : " || xslt:transform-text($segment,'commentaryfragment-seg-to-json.xsl') || "}}" 
    case 'glosse' return "{ ""_links"" : { ""self"" :  { ""href"" : ""/psalmcatenae-server/manuscripts/" || ``[`{switch(db:path($segment)) case 'oxon-s-trin-78.xml' return 'oxon-s-trin-78'  case 'vat-gr-754-transcription.xml' return 'vat-gr-754' case 'ambr-b-106-sup.xml' return 'ambr-b-106-sup' case 'ambr-m-47-sup.xml' return 'ambr-m-47-sup' case 'coislin-187-transcription.xml' return 'coislin-187' case 'bodl-auct-d-4-1.xml' return 'bodl-auct-d-4-1' case 'coislin-10-transcription.xml' return 'coislin-10' case 'coislin-12-transcription.xml' return 'coislin-12' case 'franzon-3-transcription.xml' return 'franzon-3' case 'mosq-syn-194.xml' return 'mosq-syn-194' case 'par-gr-139.xml' return 'par-gr-139' case 'par-gr-164-transcription.xml' return 'par-gr-164' case 'par-gr-166-transcription.xml' return 'par-gr-166' case 'plut-5-30.xml' return 'plut-5-30' case 'plut-6-3.xml' return 'plut-6-3' case 'vat-gr-1422-transcription.xml' return 'vat-gr-1422' default return ""}`]`` || "/glosses/" || $segment/@xml:id || """}, ""transcription"" : { ""href"" : ""https://expps.acdh-dev.oeaw.ac.at/expps/manuscripts/" 
    || ``[`{switch(db:path($segment)) case 'oxon-s-trin-78.xml' return 'oxon_s_trin_78.html'  case 'vat-gr-754-transcription.xml' return 'vat_gr_754.html' case 'ambr-b-106-sup.xml' return 'ambr_b_106_sup.html' case 'ambr-m-47-sup.xml' return 'ambr_m_47_sup.html' case 'coislin-187-transcription.xml' return 'coislin-187.html' case 'bodl-auct-d-4-1.xml' return 'bodl_auct_d_4_1.html' case 'coislin-10-transcription.xml' return 'coislin_10.html' case 'coislin-12-transcription.xml' return 'coislin_12.html' case 'franzon-3-transcription.xml' return 'franzon_3.html' case 'mosq-syn-194.xml' return 'mosq_synod_194.html' case 'par-gr-139.xml' return 'par_gr_139.html' case 'par-gr-164-transcription.xml' return 'par_gr_164.html' case 'par-gr-166-transcription.xml' return 'par_gr_166.html' case 'plut-5-30.xml' return 'plut_5_30.html' case 'plut-6-3.xml' return 'plut_6_3.html' case 'vat-gr-1422-transcription.xml' return 'vat_gr_1422.html' default return ""}`]`` 
    || "#" || $segment/@xml:id || """}}, ""_embedded"" : { ""type"" : ""glosse"", ""manuscript"" : { ""manuscriptIdentifier"" : """ || normalize-space(root($segment)/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno/text()) || """}, ""data"" : " || xslt:transform-text($segment,'glosse-seg-to-json.xsl') || "}}" 
    case 'hexaplaric' return "{ ""_links"" : { ""self"" :  { ""href"" : ""/psalmcatenae-server/manuscripts/" || ``[`{switch(db:path($segment)) case 'oxon-s-trin-78.xml' return 'oxon-s-trin-78'  case 'vat-gr-754-transcription.xml' return 'vat-gr-754' case 'ambr-b-106-sup.xml' return 'ambr-b-106-sup' case 'ambr-m-47-sup.xml' return 'ambr-m-47-sup' case 'coislin-187-transcription.xml' return 'coislin-187' case 'bodl-auct-d-4-1.xml' return 'bodl-auct-d-4-1' case 'coislin-10-transcription.xml' return 'coislin-10' case 'coislin-12-transcription.xml' return 'coislin-12' case 'franzon-3-transcription.xml' return 'franzon-3' case 'mosq-syn-194.xml' return 'mosq-syn-194' case 'par-gr-139.xml' return 'par-gr-139' case 'par-gr-164-transcription.xml' return 'par-gr-164' case 'par-gr-166-transcription.xml' return 'par-gr-166' case 'plut-5-30.xml' return 'plut-5-30' case 'plut-6-3.xml' return 'plut-6-3' case 'vat-gr-1422-transcription.xml' return 'vat-gr-1422' default return ""}`]`` || "/hexaplaric-variants/" || $segment/@xml:id || """}, ""transcription"" : { ""href"" : ""https://expps.acdh-dev.oeaw.ac.at/expps/manuscripts/" 
    || ``[`{switch(db:path($segment)) case 'oxon-s-trin-78.xml' return 'oxon_s_trin_78.html'  case 'vat-gr-754-transcription.xml' return 'vat_gr_754.html' case 'ambr-b-106-sup.xml' return 'ambr_b_106_sup.html' case 'ambr-m-47-sup.xml' return 'ambr_m_47_sup.html' case 'coislin-187-transcription.xml' return 'coislin-187.html' case 'bodl-auct-d-4-1.xml' return 'bodl_auct_d_4_1.html' case 'coislin-10-transcription.xml' return 'coislin_10.html' case 'coislin-12-transcription.xml' return 'coislin_12.html' case 'franzon-3-transcription.xml' return 'franzon_3.html' case 'mosq-syn-194.xml' return 'mosq_synod_194.html' case 'par-gr-139.xml' return 'par_gr_139.html' case 'par-gr-164-transcription.xml' return 'par_gr_164.html' case 'par-gr-166-transcription.xml' return 'par_gr_166.html' case 'plut-5-30.xml' return 'plut_5_30.html' case 'plut-6-3.xml' return 'plut_6_3.html' case 'vat-gr-1422-transcription.xml' return 'vat_gr_1422.html' default return ""}`]`` 
    || "#" || $segment/@xml:id || """}}, ""_embedded"" : { ""type"" : ""hexaplaric"", ""manuscript"" : { ""manuscriptIdentifier"" : """ || normalize-space(root($segment)/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno/text()) || """}, ""data"" : " || xslt:transform-text($segment,'hexaplaric-variant-seg-to-json.xsl') || "}}" 
    default return "{ ""_links"" : { ""self"" :  { ""href"" : ""/psalmcatenae-server/manuscripts/" || ``[`{switch(db:path($segment)) case 'oxon-s-trin-78.xml' return 'oxon-s-trin-78'  case 'vat-gr-754-transcription.xml' return 'vat-gr-754' case 'ambr-b-106-sup.xml' return 'ambr-b-106-sup' case 'ambr-m-47-sup.xml' return 'ambr-m-47-sup' case 'coislin-187-transcription.xml' return 'coislin-187' case 'bodl-auct-d-4-1.xml' return 'bodl-auct-d-4-1' case 'coislin-10-transcription.xml' return 'coislin-10' case 'coislin-12-transcription.xml' return 'coislin-12' case 'franzon-3-transcription.xml' return 'franzon-3' case 'mosq-syn-194.xml' return 'mosq-syn-194' case 'par-gr-139.xml' return 'par-gr-139' case 'par-gr-164-transcription.xml' return 'par-gr-164' case 'par-gr-166-transcription.xml' return 'par-gr-166' case 'plut-5-30.xml' return 'plut-5-30' case 'plut-6-3.xml' return 'plut-6-3' case 'vat-gr-1422-transcription.xml' return 'vat-gr-1422' default return ""}`]`` || "/commentaryfragments/" || $segment/@xml:id || """}, ""transcription"" : { ""href"" : ""https://expps.acdh-dev.oeaw.ac.at/expps/manuscripts/"
    || ``[`{switch(db:path($segment)) case 'oxon-s-trin-78.xml' return 'oxon_s_trin_78.html'  case 'vat-gr-754-transcription.xml' return 'vat_gr_754.html' case 'ambr-b-106-sup.xml' return 'ambr_b_106_sup.html' case 'ambr-m-47-sup.xml' return 'ambr_m_47_sup.html' case 'coislin-187-transcription.xml' return 'coislin-187.html' case 'bodl-auct-d-4-1.xml' return 'bodl_auct_d_4_1.html' case 'coislin-10-transcription.xml' return 'coislin_10.html' case 'coislin-12-transcription.xml' return 'coislin_12.html' case 'franzon-3-transcription.xml' return 'franzon_3.html' case 'mosq-syn-194.xml' return 'mosq_synod_194.html' case 'par-gr-139.xml' return 'par_gr_139.html' case 'par-gr-164-transcription.xml' return 'par_gr_164.html' case 'par-gr-166-transcription.xml' return 'par_gr_166.html' case 'plut-5-30.xml' return 'plut_5_30.html' case 'plut-6-3.xml' return 'plut_6_3.html' case 'vat-gr-1422-transcription.xml' return 'vat_gr_1422.html' default return ""}`]`` || "#" || $segment/@xml:id || """}}, ""_embedded"" : { ""type"" : ""commentaryfragment"", ""manuscript"" : { ""manuscriptIdentifier"" : """ || normalize-space(root($segment)/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno/text()) || """}, 
     ""data"" : " || xslt:transform-text($segment,'commentaryfragment-seg-to-json.xsl') || "}}"
    let $segments-as-json := "{ ""searchstring"" : """ || $searchstring || """, ""_embedded"" : [" || string-join($segments-as-json-result-fragment,',') || "]}"
  return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$segments-as-json}`]``)
};

(:~
 : Returns a list of paragraphs from the edition containing the search string
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/edition/search')
    %rest:query-param("searchstring", "{$searchstring}", '')
    %rest:produces('application/hal+json')
function fulltextsearch:get-list-of-paragraphs-from-edition-search($searchstring as xs:string){
  let $origin := try { request:header("Origin") } catch basex:http {'urn:local'}
  let $path := "/psalmcatenae-edition/edition-ps-1-10.xml"
  let $paragraphs-as-json-result-fragment := for $paragraph in doc($path)//tei:p[parent::tei:div[(@type = 'commentary') or (@type = 'translation')]]
    where $paragraph[. contains text {$searchstring} using stemming using language 'Greek']
    return "{ ""_links"" : { ""self"" : { ""href"" : ""/psalmcatenae-server/edition/commentaryfragments/" || $paragraph/@n || """}}, ""edition"" : ""https://expps.acdh-dev.oeaw.ac.at/expps/edition.html"", ""_embedded"" : " || xslt:transform-text($paragraph,'edition-paragraph-to-json.xsl') || " }"
    let $paragraphs-as-json := "{ ""searchstring"" : """ || $searchstring || """, ""_embedded"" : [" || string-join($paragraphs-as-json-result-fragment,',') || "]}"
   return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,``[`{$paragraphs-as-json}`]``)
};