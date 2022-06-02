(:~
 : API for querying psalmcatenae manuscripts for commentaryfragments, glosses, hexaplaric variants, and psalmtexts.
 :)
xquery version "3.1";

module namespace manuscripts = 'https://psalmcatenae.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts';

import module namespace admin = "http://basex.org/modules/admin";
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace request = "http://exquery.org/ns/request";

declare variable $manuscripts:enable-trace := true();

(:~
 : Returns a list of the available manuscript transcriptions
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts')
    %rest:produces('application/hal+json')
function manuscripts:get-list-of-manuscripts(){};

declare %private function manuscripts:write-log($message as xs:string, $severity as xs:string) {
  if ($manuscripts:enable-trace) then admin:write-log($message, $severity) else ()
};

declare %private function manuscripts:write-log($message as xs:string) {
  if ($manuscripts:enable-trace) then admin:write-log($message, "TRACE") else ()
};