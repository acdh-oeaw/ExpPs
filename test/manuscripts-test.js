'use strict';
const mocha = require('mocha');
const chakram = require('chakram');
const assert = require('chai').assert;
const request = chakram.request;
const expect = chakram.expect;

module.exports = function(baseURI){
	describe('Tests for /manuscripts', function(){
		describe('Tests for list of manuscripts', function(){
			it('Should response 200 for "OK"',function(){
				var response = request('get', baseURI + '/manuscripts', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.status(200);
				return chakram.wait();
			});
			it('Should response with list of manuscripts',function(){
				var response = request('get', baseURI + '/manuscripts', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.json({
					"_links": {
				     	"self": { "href": "/psalmcatenae-server/manuscripts" }
							  },
					"_embedded": {
						"manuscripts": [{
							"_links": {
								"self": { "href": "/psalmcatenae-server/manuscripts/vat-gr-754" }
									  },
							"manuscript-name": "Vat. gr. 754",
							"manuscript-path": "vat-gr-754" },{
							"_links": {
								"self": { "href": "/psalmcatenae-server/manuscripts/ambr-m-47-sup" }
									  },
							"manuscript-name": "Mediolan. Ambros. M. 47 sup.",
							"manuscript-path": "ambr-m-47-sup" },{
							"_links": {
								"self" : { "href": "/psalmcatenae-server/manuscripts/ambr-b-106-sup" }
									  },
							"manuscript-name": "Mediolan. Ambros. B. 106 sup.",
							"manuscript-path": "ambr-m-47-sup" },{
							"_links": {
								"self": { "href": "/psalmcatenae-server/manuscripts/athen-b-n-8" }
									  },
							"manuscript-name": "Athen. B. N. 8",
							"manuscript-path": "athen-b-n-8" },{
							"links": {
							   "self": { "href": "/psalmcatenae-server/manuscripts/bodl-auct-d-4-1" }
									},
							"manuscript-name": "Oxon. Bodl. Auct. D. 4.1",
							"manuscript-path": "bodl-auct-d-4-1" },{
							"links": {
							   "self": { "href": "/psalmcatenae-server/manuscripts/coislin-10" }
									},
							"manuscript-name": "Paris. Coislin 10",
							"manuscript-path": "coislin-10" },{
							"links": {
							   "self": { "href": "/psalmcatenae-server/manuscripts/coislin-12" }
									},
							"manuscript-name": "Paris. Coislin 12",
							"manuscript-path": "coislin-12" },{
							"links": {
							   "self": { "href": "/psalmcatenae-server/manuscripts/franzon-3" }
									},
							"manuscript-name": "Genuensis Urbanus 3",
							"manuscript-path": "franzon-3" },{
							"links": {
							   "self": { "href": "/psalmcatenae-server/manuscripts/mosq-syn-194" }
									},
							"manuscript-name": "Mosq. Synod. 194",
							"manuscript-path": "mosq-syn-194" },{
							"links": {
							   "self": { "href": "/psalmcatenae-server/manuscripts/oxon-s-trin-78" }
									},
							"manuscript-name": "Oxon. Coll. S. Trin. 78",
							"manuscript-path": "oxon-s-trin-78" },{
							"links": {
							   "self": { "href": "/psalmcatenae-server/manuscripts/par-gr-139" }
									},
							"manuscript-name": "Paris. gr. 139",
							"manuscript-path": "par-gr-139" },{
							"links": {
							   "self": { "href": "/psalmcatenae-server/manuscripts/par-gr-164" }
									},
							"manuscript-name": "Paris. gr. 164",
							"manuscript-path": "par-gr-164" },{
							"links": {
							   "self": { "href": "/psalmcatenae-server/manuscripts/par-gr-166" }
									},
							"manuscript-name": "Paris. gr. 166-167",
							"manuscript-path": "par-gr-166" },{
							"links": {
							   "self": { "href": "/psalmcatenae-server/manuscripts/plut-5-30" }
									},
							"manuscript-name": "Flor. Med. Laurent. Plut. 5.30",
							"manuscript-path": "plut-5-30" },{
							"links": {
							   "self": { "href": "/psalmcatenae-server/manuscripts/plut-6-3" }
									},
							"manuscript-name": "Flor. Med. Laurent. Plut. 6.3",
							"manuscript-path": "plut-6-3" },{
							"links": {
							   "self": { "href": "/psalmcatenae-server/manuscripts/vat-gr-1422" }
									},
							"manuscript-name": "Vat. gr. 1422",
							"manuscript-path": "vat-gr-1422" }
						  ]}				
						});
				return chakram.wait();
			});
		});
	});
}