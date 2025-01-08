'use strict';
const mocha = require('mocha');
const chakram = require('chakram');
const assert = require('chai').assert;
const request = chakram.request;
const expect = chakram.expect;

module.exports = function(baseURI){
	describe('Tests for /glosses', function(){
		describe('Tests for list of glosses from all manuscripts', function(){
			xit('Should response 200 for "OK"',function(){
				var response = request('get', baseURI + '/glosses', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.status(200);
				return chakram.wait();
			});
        });
        describe('Tests for /glosses/{$glosse-id}', function(){
			xit('Should response with a particular glosse',function(){
				var response = request('get', baseURI + '/glosses/vat-gr-754-glosse-1-5', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.json({ "_links" : { "self" : { "href" : "/psalmcatenae-server/glosses/vat-gr-754-glosse-1-5"}, "psalm" : { "href" : "/psalmcatenae-server/psalmtexts/vat-gr-754-ps-1-1"}}, "_embedded" : { "glosse" : {"id" : "vat-gr-754-glosse-1-5", "attribution" : "Anonymous", "source" : "fons ignotus in Ps 1,1c (Analecta Sacra II 445, 24–25)", "text" : "Τὴν τῶν κακῶν ἐργα σίαν κατὰ διάδο σιν γινομένην: –"}}});
				return chakram.wait();
			});
        });
    });
    describe('Tests for /manuscripts/{$manuscript-name}/glosses', function(){
		describe('Tests for list of glosses from a particular manuscript', function(){
			xit('Should response 200 for "OK"',function(){
				var response = request('get', baseURI + '/manuscripts/vat-gr-754/glosses', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.status(200);
				return chakram.wait();
			});
            xit('Should response with a list of glosses of a particular manuscript',function(){
				var response = request('get', baseURI + '/manuscripts/vat-gr-754/glosses', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.json({ "_links" : { "self" : { "href" : "/psalmcatenae-server/manuscripts/vat-gr-754/glosses" }}, "_embedded" : { "glosses" : [{ "_links" : { "self" : { "href" : "/psalmcatenae-server/manuscripts/vat-gr-754/glosses/vat-gr-754-glosse-1-1"}}, "attribution" : "Anonymous", "author-critical" : "fons ignotus (ed. Dorival IV 366)"},{ "_links" : { "self" : { "href" : "/psalmcatenae-server/manuscripts/vat-gr-754/glosses/vat-gr-754-glosse-1-2"}}, "attribution" : "Anonymous", "author-critical" : "fons ignotus; cf. fr. 3 Dorival (IV 367)"},{ "_links" : { "self" : { "href" : "/psalmcatenae-server/manuscripts/vat-gr-754/glosses/vat-gr-754-glosse-1-3"}}, "attribution" : "Anonymous", "author-critical" : "Basilius, hom. in Ps 1 (PG 29, 216 B5–7 in Ps 1,1a)"},{ "_links" : { "self" : { "href" : "/psalmcatenae-server/manuscripts/vat-gr-754/glosses/vat-gr-754-glosse-1-8"}}, "attribution" : "Anonymous", "author-critical" : "fons ignotus in Ps 1,1a; Suda, s.v. Μακάριος (Μ nr. 55 Adler) et alibi"},{ "_links" : { "self" : { "href" : "/psalmcatenae-server/manuscripts/vat-gr-754/glosses/vat-gr-754-glosse-1-4"}}, "attribution" : "Anonymous", "author-critical" : "fons ignotus in Ps 1,1a (in ἀσεβῶν; Analecta Sacra II 445, 23)"},{ "_links" : { "self" : { "href" : "/psalmcatenae-server/manuscripts/vat-gr-754/glosses/vat-gr-754-glosse-1-5"}}, "attribution" : "Anonymous", "author-critical" : "fons ignotus in Ps 1,1c (Analecta Sacra II 445, 24–25)"},{ "_links" : { "self" : { "href" : "/psalmcatenae-server/manuscripts/vat-gr-754/glosses/vat-gr-754-glosse-1-6"}}, "attribution" : "Anonymous", "author-critical" : "fons ignotus in Ps 1,1c (in λοιμῶν)"},{ "_links" : { "self" : { "href" : "/psalmcatenae-server/manuscripts/vat-gr-754/glosses/vat-gr-754-glosse-1-7"}}, "attribution" : "Anonymous", "author-critical" : "fons ignotus in Ps 1,1c (in οὐκ ἐκάθισεν)"},{ "_links" : { "self" : { "href" : "/psalmcatenae-server/manuscripts/vat-gr-754/glosses/vat-gr-754-glosse-1-9"}}, "attribution" : "Anonymous", "author-critical" : "fons ignotus in Ps 1,4b"},{ "_links" : { "self" : { "href" : "/psalmcatenae-server/manuscripts/vat-gr-754/glosses/vat-gr-754-glosse-2-1"}}, "attribution" : "Anonymous", "author-critical" : ""},{ "_links" : { "self" : { "href" : "/psalmcatenae-server/manuscripts/vat-gr-754/glosses/vat-gr-754-glosse-2-2"}}, "attribution" : "Anonymous", "author-critical" : "fons ignotus in Ps 2,3b (PG 27, 65 A7–8)"},{ "_links" : { "self" : { "href" : "/psalmcatenae-server/manuscripts/vat-gr-754/glosses/vat-gr-754-glosse-2-3"}}, "attribution" : "Anonymous", "author-critical" : "fons ignotus in Ps 2,1b"},{ "_links" : { "self" : { "href" : "/psalmcatenae-server/manuscripts/vat-gr-754/glosses/vat-gr-754-glosse-2-4"}}, "attribution" : "Anonymous", "author-critical" : "fons ignotus in Ps 2,7a"},{ "_links" : { "self" : { "href" : "/psalmcatenae-server/manuscripts/vat-gr-754/glosses/vat-gr-754-glosse-3-1"}}, "attribution" : "Anonymous", "author-critical" : "fons ignotus in Ps 3,7b"},{ "_links" : { "self" : { "href" : "/psalmcatenae-server/manuscripts/vat-gr-754/glosses/vat-gr-754-gloss-5-1"}}, "attribution" : "Anonymous", "author-critical" : "fons ignotus in Ps 5,10d (PG 27,76 B4–5)"}]}});
                return chakram.wait();
			});
            xit('Should response with a particular glosse of a particular manuscript',function(){
				var response = request('get', baseURI + '/manuscripts/vat-gr-754/glosses/vat-gr-754-glosse-1-6', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.json({ "_links" : { "self" : { "href" : "/psalmcatenae-server/vat-gr-754/glosses/vat-gr-754-glosse-1-6"}, "psalm" : { "href" : "/psalmcatenae-server/vat-gr-754/psalmtexts/vat-gr-754-ps-1-1"}}, "_embedded" : { "glosse" : {"id" : "vat-gr-754-glosse-1-6", "attribution" : "Anonymous", "source" : "fons ignotus in Ps 1,1c (in λοιμῶν)", "text" : "ἀκαθάρτων: –"}}})
                return chakram.wait();
			});
        });
    });
}