(:~
 : API for querying psalmcatenae manuscripts for commentaryfragments, glosses, hexaplaric variants, and psalmtexts.
 :)
xquery version "3.1";

module namespace hexaplaric-variants = 'https://psalmcatenae.acdh-dev.oeaw.ac.at/psalmcatenae-server/hexaplaric-variants';

import module namespace admin = "http://basex.org/modules/admin";
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace request = "http://exquery.org/ns/request";

declare variable $hexaplaric-variants:enable-trace := true();

(:~
 : Returns a list of available hexaplaric variants from all transcribed manuscripts
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/hexaplaric-variants')
    %rest:produces('application/hal+json')
function hexaplaric-variants:get-list-of-hexaplaric-variants(){};

(:~
 : Returns a particular hexaplaric variant.
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/hexaplaric-variants/{$hexaplaric-variant-id}')
    %rest:produces('application/hal+json')
function hexaplaric-variants:get-hexaplaric-variant($hexaplaric-variant-id as xs:string){};

(:~
 : Returns a list of available hexaplaric variants from a given transcribed manuscript 
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/hexaplaric-variants')
    %rest:produces('application/hal+json')
function hexaplaric-variants:get-list-of-hexaplaric-variants-from-manuscript($manuscript-name as xs:string){};

(:~
 : Return a particular hexaplaric variant of a particular manuscript
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/hexaplaric-variants/{$hexaplaric-variant-id}')
    %rest:produces('application/hal+json')
function hexaplaric-variants:get-hexaplaric-variant-from-manuscript($manuscript-name as xs:string,$hexaplaric-variant-id as xs:string){};

declare %private function hexaplaric-variants:write-log($message as xs:string, $severity as xs:string) {
  if ($hexaplaric-variants:enable-trace) then admin:write-log($message, $severity) else ()
};

declare %private function hexaplaric-variants:write-log($message as xs:string) {
  if ($hexaplaric-variants:enable-trace) then admin:write-log($message, "TRACE") else ()
};