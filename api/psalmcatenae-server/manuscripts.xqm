(:~
 : API for querying psalmcatenae manuscripts for commentaryfragments, glosses, hexaplaric variants, and psalmtexts.
 :)
xquery version "3.1";

module namespace manuscripts = 'https://psalmcatenae.acdh-dev.oeaw.ac.at/psalmcatenae-server/manuscripts';

import module namespace admin = "http://basex.org/modules/admin";
import module namespace rest = "http://exquery.org/ns/restxq";
import module namespace request = "http://exquery.org/ns/request";
import module namespace http = "http://expath.org/ns/http-client";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";

declare variable $manuscripts:enable-trace := true();

(:~
 : Returns a list of the available manuscript transcriptions
 :)
declare
    %rest:GET
    %rest:path('/psalmcatenae-server/manuscripts')
    %rest:produces('application/hal+json')
    %output:method("json")
function manuscripts:get-list-of-manuscripts(){
  let $origin := try { request:header("Origin") } catch basex:http {'urn:local'}
  return
  <rest:response>
    <output:serialization-parameters>
        <output:media-type value="application/hal+json"/>
    </output:serialization-parameters>
    <http:response status="200" message="OK">
      <http:header name="Access-Control-Allow-Origin" value="{$origin}"/>
    </http:response>
  </rest:response>,
  "{
    '_links': {
        'self': { 'href': '/psalmcatenae-server/manuscripts' }
              },
    '_embedded': {
        'manuscripts': [{
            '_links': {
                'self': { 'href': '/psalmcatenae-server/manuscripts/vat-gr-754' }
                      },
            'manuscript-name': 'Vat. gr. 754',
            'manuscript-path': 'vat-gr-754' },{
            '_links': {
                'self': { 'href': '/psalmcatenae-server/manuscripts/ambr-m-47-sup' }
                      },
            'manuscript-name': 'Mediolan. Ambros. M. 47 sup.',
            'manuscript-path': 'ambr-m-47-sup' },{
            '_links': {
                'self': { 'href': '/psalmcatenae-server/manuscripts/ambr-b-106-sup' }
                      },
            'manuscript-name': 'Mediolan. Ambros. B. 106 sup.',
            'manuscript-path': 'ambr-m-47-sup' },{
            '_links': {
                'self': { 'href': '/psalmcatenae-server/manuscripts/athen-b-n-8' }
                      },
            'manuscript-name': 'Athen. B. N. 8',
            'manuscript-path': 'athen-b-n-8' },{
            'links': {
               'self': { 'href': '/psalmcatenae-server/manuscripts/bodl-auct-d-4-1' }
                    },
            'manuscript-name': 'Oxon. Bodl. Auct. D. 4.1',
            'manuscript-path': 'bodl-auct-d-4-1' },{
            'links': {
               'self': { 'href': '/psalmcatenae-server/manuscripts/coislin-10' }
                    },
            'manuscript-name': 'Paris. Coislin 10',
            'manuscript-path': 'coislin-10' },{
            'links': {
               'self': { 'href': '/psalmcatenae-server/manuscripts/coislin-12' }
                    },
            'manuscript-name': 'Paris. Coislin 12',
            'manuscript-path': 'coislin-12' },{
            'links': {
               'self': { 'href': '/psalmcatenae-server/manuscripts/franzon-3' }
                    },
            'manuscript-name': 'Genuensis Urbanus 3',
            'manuscript-path': 'franzon-3' },{
            'links': {
               'self': { 'href': '/psalmcatenae-server/manuscripts/mosq-syn-194' }
                    },
            'manuscript-name': 'Mosq. Synod. 194',
            'manuscript-path': 'mosq-syn-194' },{
            'links': {
               'self': { 'href': '/psalmcatenae-server/manuscripts/oxon-s-trin-78' }
                    },
            'manuscript-name': 'Oxon. Coll. S. Trin. 78',
            'manuscript-path': 'oxon-s-trin-78' },{
            'links': {
               'self': { 'href': '/psalmcatenae-server/manuscripts/par-gr-139' }
                    },
            'manuscript-name': 'Paris. gr. 139',
            'manuscript-path': 'par-gr-139' },{
            'links': {
               'self': { 'href': '/psalmcatenae-server/manuscripts/par-gr-164' }
                    },
            'manuscript-name': 'Paris. gr. 164',
            'manuscript-path': 'par-gr-164' },{
            'links': {
               'self': { 'href': '/psalmcatenae-server/manuscripts/par-gr-166' }
                    },
            'manuscript-name': 'Paris. gr. 166-167',
            'manuscript-path': 'par-gr-166' },{
            'links': {
               'self': { 'href': '/psalmcatenae-server/manuscripts/plut-5-30' }
                    },
            'manuscript-name': 'Flor. Med. Laurent. Plut. 5.30',
            'manuscript-path': 'plut-5-30' },{
            'links': {
               'self': { 'href': '/psalmcatenae-server/manuscripts/plut-6-3' }
                    },
            'manuscript-name': 'Flor. Med. Laurent. Plut. 6.3',
            'manuscript-path': 'plut-6-3' },{
            'links': {
               'self': { 'href': '/psalmcatenae-server/manuscripts/vat-gr-1422' }
                    },
            'manuscript-name': 'Vat. gr. 1422',
            'manuscript-path': 'vat-gr-1422' }
          ]}
        }"
};

declare %private function manuscripts:write-log($message as xs:string) {
  if ($manuscripts:enable-trace) then admin:write-log($message, "INFO") else ()
};