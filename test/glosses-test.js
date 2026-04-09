'use strict';
const mocha = require('mocha');
const chakram = require('chakram');
const assert = require('chai').assert;
const request = chakram.request;
const expect = chakram.expect;

module.exports = function(baseURI){
	describe('Tests for /glosses', function(){
		describe('Tests for list of glosses from all manuscripts', function(){
			it('Should response 200 for "OK"',function(){
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
			it('Should response with a particular glosse',function(){
				var response = request('get', baseURI + '/glosses/vat-gr-754-glosse-1-5', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.json({ "_links" : { "self" : { "href" : "/psalmcatenae-server/glosses/vat-gr-754-glosse-1-5"}, "psalm" : { "href" : "/psalmcatenae-server/psalmtexts/vat-gr-754-ps-1-1"}}, "_embedded" : { "glosse" : {"id" : "vat-gr-754-glosse-1-5", "attribution" : "Anonymous", "source" : "fons ignotus in Ps 1,1c (ἐπὶ καθέδραν; Analecta sacra II 445,24–25)", "text" : "Τὴν τῶν κακῶν ἐργα  σίαν κατὰ διάδο σιν γινομένην: –"}}});
				return chakram.wait();
			});
        });
    });
    describe('Tests for /manuscripts/{$manuscript-name}/glosses', function(){
		describe('Tests for list of glosses from a particular manuscript', function(){
			it('Should response 200 for "OK"',function(){
				var response = request('get', baseURI + '/manuscripts/vat-gr-754/glosses', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.status(200);
				return chakram.wait();
			});
            it('Should response with a list of glosses of a particular manuscript',function(){
				var response = request('get', baseURI + '/manuscripts/vat-gr-754/glosses', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.be.an("object");
                return chakram.wait();
			});
            it('Should response with a particular glosse of a particular manuscript',function(){
				var response = request('get', baseURI + '/manuscripts/vat-gr-754/glosses/vat-gr-754-glosse-1-6', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.json({ "_links" : { "self" : { "href" : "/psalmcatenae-server/vat-gr-754/glosses/vat-gr-754-glosse-1-6"}, "psalm" : { "href" : "/psalmcatenae-server/vat-gr-754/psalmtexts/vat-gr-754-ps-1-1"}}, "_embedded" : { "glosse" : {"id" : "vat-gr-754-glosse-1-6", "attribution" : "Anonymous", "source" : "fons ignotus in Ps 1,1c (λοιμῶν)", "text" : "ἀκαθάρτων: –"}}})
                return chakram.wait();
			});
        });
    });
}