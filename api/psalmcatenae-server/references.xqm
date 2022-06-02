(:~
 : API for querying psalmcatenae manuscripts for commentaryfragments, glosses, hexaplaric variants, and psalmtexts.
 :)
xquery version "3.1";

module namespace references = 'https://psalmcatenae.acdh-dev.oeaw.ac.at/psalmcatenae-server/references';

import module namespace admin = "http://basex.org/modules/admin";
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace request = "http://exquery.org/ns/request";

declare variable $references:enable-trace := true();

(:~
 : Returns a list of references of psalmtexts for which one or more commentaryfragments exist in a given manuscript.
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/references')
    %rest:produces('application/hal+json')
function references:get-references-of-manuscript($manuscript-name as xs:string){};

declare %private function references:write-log($message as xs:string, $severity as xs:string) {
  if ($references:enable-trace) then admin:write-log($message, $severity) else ()
};

declare %private function references:write-log($message as xs:string) {
  if ($references:enable-trace) then admin:write-log($message, "TRACE") else ()
};