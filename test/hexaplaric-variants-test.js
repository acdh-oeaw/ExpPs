'use strict';
const mocha = require('mocha');
const chakram = require('chakram');
const assert = require('chai').assert;
const request = chakram.request;
const expect = chakram.expect;

module.exports = function(baseURI){
	describe('Tests for /hexaplaric-variants', function(){
		describe('Tests for list of hexaplaric variants from all manuscripts', function(){
			it('Should response 200 for "OK"',function(){
				var response = request('get', baseURI + '/hexaplaric-variants', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.status(200);
				return chakram.wait();
			});
        });
        describe('Tests for /hexaplaric-variants/{$hexaplaric-variant-id}', function(){
			it('Should response with a particular hexaplaric variant',function(){
				var response = request('get', baseURI + '/hexaplaric-variants/vat-gr-754-hexaplaric-1-2', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.json({ "_links" : { "self" : { "href" : "/psalmcatenae-server/hexaplaric-variants/vat-gr-754-hexaplaric-1-2"}, "psalm" : { "href" : "/psalmcatenae-server/psalmtexts/vat-gr-754-ps-1-1"}}, "_embedded" : { "hexaplaric-variant" : {"id" : "vat-gr-754-hexaplaric-1-2", "attribution" : "Anonymus (Ps 1,1a)", "text" : "Ἄμεμπτος  ὁ ἄνθρωπος  ὃς  οὐ περιεπάτησεν ἐν συνεδρίῳ παρανόμων·"}}});
				return chakram.wait();
			});
        });
    });
    describe('Tests for /manuscripts/{$manuscript-name}/hexaplaric-variants', function(){
		describe('Tests for list of hexaplaric variants from a particular manuscript', function(){
			it('Should response 200 for "OK"',function(){
				var response = request('get', baseURI + '/manuscripts/vat-gr-754/hexaplaric-variants', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.status(200);
				return chakram.wait();
			});
            it('Should response with a list of hexaplaric variants of a particular manuscript',function(){
				var response = request('get', baseURI + '/manuscripts/vat-gr-754/hexaplaric-variants', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.be.an("object");
				return chakram.wait();
			});
            it('Should response with a particular hexaplaric variant of a particular manuscript',function(){
				var response = request('get', baseURI + '/manuscripts/vat-gr-754/hexaplaric-variants/vat-gr-754-hexaplaric-1-2', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.json({ "_links" : { "self" : { "href" : "/psalmcatenae-server/manuscripts/vat-gr-754/hexaplaric-variant/vat-gr-754-hexaplaric-1-2"}, "psalm" : { "href" : "/psalmcatenae-server/manuscripts/vat-gr-754/psalmtexts/vat-gr-754-ps-1-1"}}, "_embedded" : { "hexaplaric-variant" : {"id" : "vat-gr-754-hexaplaric-1-2", "attribution" : "Anonymus (Ps 1,1a)", "text" : "Ἄμεμπτος  ὁ ἄνθρωπος  ὃς  οὐ περιεπάτησεν ἐν συνεδρίῳ παρανόμων·"}} })
                return chakram.wait();
			});
        });
    });
}