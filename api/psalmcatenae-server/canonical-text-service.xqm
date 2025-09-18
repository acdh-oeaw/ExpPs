(:~
 : API endpoint for canonical text service for accessing commentary fragments of Ps.-Ath. ExpPs
 :)
xquery version "3.1";

module namespace cts = 'https://psalmcatenae.acdh-dev.oeaw.ac.at/psalmcatenae-server/cts/';

import module namespace admin = "http://basex.org/modules/admin";
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace request = "http://exquery.org/ns/request";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace response-codes = "https://tools.ietf.org/html/rfc7231#section-6";

(:~
 : canonical text service
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/cts')
    %rest:query-param("request", "{$request}", '')
    %rest:query-param("urn", "{$urn}", '')
    %rest:produces('application/xml')
function cts:canonical-text-service($request as xs:string,$urn as xs:string){
  let $origin := try { request:header("Origin") } catch basex:http {'urn:local'}
  let $request-type := switch ($request)
    case 'GetPassage' return 'GetPassage'
    case 'GetCapabilities' return error(xs:QName('response-codes:_501'),'Not Implemented')
    case 'GetValidReff' return error(xs:QName('response-codes:_501'),'Not Implemented')
    case 'GetFirstUrn' return error(xs:QName('response-codes:_501'),'Not Implemented')
    case 'GetPrevNextUrn' return error(xs:QName('response-codes:_501'),'Not Implemented')
    case 'GetLabel' return error(xs:QName('response-codes:_501'),'Not Implemented')
    case 'GetPassagePlus' return error(xs:QName('response-codes:_501'),'Not Implemented')
    default return error(xs:QName('response-codes:_400'),'Bad Request')
  let $fragments-of-urn := tokenize($urn,':')
  let $namespace := $fragments-of-urn[3]
  let $work-id := $fragments-of-urn[4]
  let $passage := $fragments-of-urn[5]
  let $work-components := tokenize($work-id,"\.")
  let $textgroup := $work-components[1]
  let $work := $work-components[2]
  let $language := $work-components[3]
  let $path := "/psalmcatenae-edition/edition-ps-1-10.xml"
  let $available-fragments := for $commentaryfragment in doc($path)/tei:TEI/tei:text/tei:body/tei:div[@type = 'psalm']/tei:div[@type = 'psalmverse']/tei:div[(@xml:lang = 'grc') and (@type = 'text')]/tei:div[(@type = 'commentary') and (not(exists(@rend)) or (@rend = 'parallel') or (@rend = 'hide'))]/tei:p return if ($commentaryfragment/parent::tei:div/@rend = 'hide') then concat($commentaryfragment/@n,'par') else $commentaryfragment/@n
  let $result-text := if ($language = 'grc') 
  then if (not(contains($passage,'par'))) then for $commentaryfragment in doc($path)/tei:TEI/tei:text/tei:body/tei:div[@type = 'psalm']/tei:div[@type = 'psalmverse']/tei:div[(@xml:lang = 'grc') and (@type = 'text')]/tei:div[(@type = 'commentary') and (not(exists(@rend)) or (@rend = 'parallel'))]/tei:p where $commentaryfragment/@n = $passage return string-join($commentaryfragment/descendant::text(),'') else for $commentaryfragment in doc($path)/tei:TEI/tei:text/tei:body/tei:div[@type = 'psalm']/tei:div[@type = 'psalmverse']/tei:div[(@xml:lang = 'grc') and (@type = 'text')]/tei:div[(@type = 'commentary') and (exists(@rend) and (@rend = 'hide'))]/tei:p where $commentaryfragment/@n = substring-before($passage,'par') return string-join($commentaryfragment/descendant::text(),'')
  else if (not(contains($passage,'par'))) then for $commentaryfragment in doc($path)/tei:TEI/tei:text/tei:body/tei:div[@type = 'psalm']/tei:div[@type = 'psalmverse']/tei:div[(@xml:lang = 'grc') and (@type = 'text')]/tei:div[(@type = 'commentary') and (not(exists(@rend)) or (@rend = 'parallel'))]/tei:p where $commentaryfragment/@n = $passage return $commentaryfragment/parent::tei:div[@type = 'commentary']/parent::tei:div[@type = 'text']/parent::tei:div[@type = 'psalmverse']/tei:div[(@type = 'translation') and (@xml:lang = 'de')]/tei:p[substring-after(@corresp,'#') = $commentaryfragment/@xml:id]/text() else for $commentaryfragment in doc($path)/tei:TEI/tei:text/tei:body/tei:div[@type = 'psalm']/tei:div[@type = 'psalmverse']/tei:div[(@xml:lang = 'grc') and (@type = 'text')]/tei:div[(@type = 'commentary') and (exists(@rend) and (@rend = 'hide'))]/tei:p where $commentaryfragment/@n = substring-before($passage,'par') return $commentaryfragment/parent::tei:div[@type = 'commentary']/parent::tei:div[@type = 'text']/parent::tei:div[@type = 'psalmverse']/tei:div[(@type = 'translation') and (@xml:lang = 'de')]/tei:p[substring-after(@corresp,'#') = $commentaryfragment/@xml:id]/text()
  let $result-xml-fragment := if (not(($namespace eq 'etf') and ($textgroup eq 'psath') and ($work eq 'expps') and (($language eq 'ger') or ($language eq 'grc'))))
     then 
       element CTSError {
          element message { 'Invalid URN syntax. Use urn:cts:etf:psath.expps.(grc|ger):(number). For example: urn:cts:etf:psath.expps.grc:1 - for the first commentary fragment in ancient greek.' },
          element code { '2' }
      }
     else if (not($available-fragments = $passage)) then
       element CTSError {
         element message { 'URN refers in invalid value. Use urn:cts:etf:psath.expps.(grc|ger):(number) with a number out of: ' || string-join($available-fragments,', ') },
         element code { '3' }
       }
     else element {$request-type} {
       element request {
         element requestName { $request-type },
         element requestUrn { concat('urn:cts:etf:psath.expps.',$language,':',$passage) }
       },
       element reply {
         element urn { concat('urn:cts:etf:psath.expps.',$language,':',$passage) },
         element passage { ``[`{$result-text}`]`` },
         element license { "Available under the Creative Commons Attribution 4.0 International (CC BY 4.0)" },
         element source { "Heil, Uta; Panteghini, Sebastiano, (Ps.)-Athanasius, Expositiones in Psalmos. Fragment " || $passage || " - " || concat('urn:cts:etf:psath.expps.',$language,':',$passage) || " (https://expps.acdh-dev.oeaw.ac.at/expps/edition.html)."}
       }
     }
  return
  (<rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/xml"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,$result-xml-fragment)
};