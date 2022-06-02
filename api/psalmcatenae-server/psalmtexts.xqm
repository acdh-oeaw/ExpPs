(:~
 : API for querying psalmcatenae manuscripts for commentaryfragments, glosses, hexaplaric variants, and psalmtexts.
 :)
xquery version "3.1";

module namespace psalmtexts = 'https://psalmcatenae.acdh-dev.oeaw.ac.at/psalmcatenae-server/psalmtexts';

import module namespace admin = "http://basex.org/modules/admin";
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace request = "http://exquery.org/ns/request";

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
function psalmtexts:get-list-of-psalmtexts-from-manuscript($manuscript-name as xs:string){};

(:~
 : Return a particular psalmtext of a particular manuscript
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/psalmtexts/{$psalmtext-id}')
    %rest:produces('application/hal+json')
function psalmtexts:get-psalmtext-from-manuscript($manuscript-name as xs:string,$psalmtext-id as xs:string){};

declare %private function psalmtexts:write-log($message as xs:string, $severity as xs:string) {
  if ($psalmtexts:enable-trace) then admin:write-log($message, $severity) else ()
};

declare %private function psalmtexts:write-log($message as xs:string) {
  if ($psalmtexts:enable-trace) then admin:write-log($message, "TRACE") else ()
};