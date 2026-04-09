'use strict';
const mocha = require('mocha');
const chakram = require('chakram');
const assert = require('chai').assert;
const request = chakram.request;
const expect = chakram.expect;

module.exports = function(baseURI){
	describe('Tests for /manuscripts/{$manuscript-name}/authors-critical', function(){
		describe('Tests for list of critical assigned authors in Vat. gr. 754', function(){
			it('Should response 200 for "OK"', async function(){
				var response = await request('get', baseURI + '/manuscripts/vat-gr-754/authors-critical', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.status(200);
				return chakram.wait();
			});
			it('Should response with list of critical assigned authors', async function(){
				var response = await request('get', baseURI + '/manuscripts/vat-gr-754/authors-critical', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.be.an("object");
				return chakram.wait();
			});
        });
    });
    describe('Tests for /manuscripts/{$manuscript-name}/authors-critical-distinct', function(){
		describe('Tests for list of distinct critical assigned authors in Vat. gr. 754', function(){
			it('Should response 200 for "OK"', async function(){
				var response = await request('get', baseURI + '/manuscripts/vat-gr-754/authors-critical-distinct', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.status(200);
				return chakram.wait();
			});
			it('Should response with list of distinct critical assigned authors', async function(){
				var response = await request('get', baseURI + '/manuscripts/vat-gr-754/authors-critical-distinct', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.be.an("object");
				return chakram.wait();
			});
        });
    });
}