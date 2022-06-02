(:~
 : API for querying psalmcatenae manuscripts for commentaryfragments, glosses, hexaplaric variants, and psalmtexts.
 :)
xquery version "3.1";

module namespace glosses = 'https://psalmcatenae.acdh-dev.oeaw.ac.at/psalmcatenae-server/glosses';

import module namespace admin = "http://basex.org/modules/admin";
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace request = "http://exquery.org/ns/request";

declare variable $glosses:enable-trace := true();

(:~
 : Returns a list of available glosses from all transcribed manuscripts
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/glosses')
    %rest:produces('application/hal+json')
function glosses:get-list-of-glosses(){};

(:~
 : Returns a particular gloss.
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/glosses/{$gloss-id}')
    %rest:produces('application/hal+json')
function glosses:get-gloss($gloss-id as xs:string){};

(:~
 : Returns a list of available glosses from a given transcribed manuscript 
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/glosses')
    %rest:produces('application/hal+json')
function glosses:get-list-of-glosses-from-manuscript($manuscript-name as xs:string){};

(:~
 : Return a particular gloss of a particular manuscript
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/glosses/{$gloss-id}')
    %rest:produces('application/hal+json')
function glosses:get-gloss-from-manuscript($manuscript-name as xs:string,$gloss-id as xs:string){};

declare %private function glosses:write-log($message as xs:string, $severity as xs:string) {
  if ($glosses:enable-trace) then admin:write-log($message, $severity) else ()
};

declare %private function glosses:write-log($message as xs:string) {
  if ($glosses:enable-trace) then admin:write-log($message, "TRACE") else ()
};