(:~
 : API for querying psalmcatenae manuscripts for commentaryfragments, glosses, hexaplaric variants, and psalmtexts.
 :)
xquery version "3.1";

module namespace commentaryfragments = 'https://psalmcatenae.acdh-dev.oeaw.ac.at/psalmcatenae-server/commentaryfragments';

import module namespace admin = "http://basex.org/modules/admin";
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace request = "http://exquery.org/ns/request";

declare variable $commentaryfragments:enable-trace := true();

(:~
 : Returns a list of available commentaryfragments from all transcribed manuscripts
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/commentaryfragments')
    %rest:produces('application/hal+json')
function commentaryfragments:get-list-of-commentaryfragments(){};

(:~
 : Returns a particular commentaryfragment
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/commentaryfragments/{$commentaryfragment-id}')
    %rest:produces('application/hal+json')
function commentaryfragments:get-commentaryfragment($commentaryfragment-id as xs:string){};

(:~
 : Returns a list of available commentaryfragments from a given transcribed manuscript 
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/commentaryfragments')
    %rest:query-param("author", "{$author}", '')
    %rest:query-param("reference", "{$reference}", '')
    %rest:produces('application/hal+json')
function commentaryfragments:get-list-of-commentaryfragments-from-manuscript($manuscript-name as xs:string,$author as xs:string,$reference as xs:string){};

(:~
 : Return a particular commentaryfragment of a particular manuscript
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts/{$manuscript-name}/commentaryfragments/{$commentaryfragment-id}')
    %rest:produces('application/hal+json')
function commentaryfragments:get-commentaryfragment-from-manuscript($manuscript-name as xs:string,$commentaryfragment-id as xs:string){};

declare %private function commentaryfragments:write-log($message as xs:string, $severity as xs:string) {
  if ($commentaryfragments:enable-trace) then admin:write-log($message, $severity) else ()
};

declare %private function commentaryfragments:write-log($message as xs:string) {
  if ($commentaryfragments:enable-trace) then admin:write-log($message, "TRACE") else ()
};