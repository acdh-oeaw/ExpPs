(:~
 : API for querying psalmcatenae manuscripts for commentaryfragments, glosses, hexaplaric variants, and psalmtexts.
 :)
xquery version "3.1";

module namespace authors-critical = 'https://psalmcatenae.acdh-dev.oeaw.ac.at/psalmcatenae-server/authors-critical';

import module namespace admin = "http://basex.org/modules/admin";
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace request = "http://exquery.org/ns/request";

declare variable $authors-critical:enable-trace := true();

(:~
 : Returns a list of critical assigned authors of commentaryfragments in a given manuscript
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/authors-critical')
    %rest:produces('application/hal+json')
function authors-critical:get-authors-critical-of-manuscript($manuscript-name as xs:string){};

declare %private function authors-critical:write-log($message as xs:string, $severity as xs:string) {
  if ($authors-critical:enable-trace) then admin:write-log($message, $severity) else ()
};

declare %private function authors-critical:write-log($message as xs:string) {
  if ($authors-critical:enable-trace) then admin:write-log($message, "TRACE") else ()
};