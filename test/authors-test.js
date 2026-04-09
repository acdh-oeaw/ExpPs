'use strict';
const mocha = require('mocha');
const chakram = require('chakram');
const assert = require('chai').assert;
const request = chakram.request;
const expect = chakram.expect;

module.exports = function(baseURI){
	describe('Tests for /manuscripts/{$manuscript-name}/authors', function(){
		describe('Tests for list of authors in Vat. gr. 754', function(){
			it('Should response 200 for "OK"', function(){
				var response = request('get', baseURI + '/manuscripts/vat-gr-754/authors', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.status(200);
				return chakram.wait();
			});
			it('Should response with list of authors', function(){
				var response = request('get', baseURI + '/manuscripts/vat-gr-754/authors', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.be.an("object");
				return chakram.wait();
			});
        });
	});
    describe('Tests for /manuscripts/{$manuscript-name}/authors-distinct', function(){
        describe('Tests for list of distinct authors in Vat. gr. 754', function(){
            it('Should response 200 for "OK"', function(){
				var response = request('get', baseURI + '/manuscripts/vat-gr-754/authors-distinct', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.status(200);
				return chakram.wait();
			});
            it('Should response with list of distinct authors', function(){
				var response = request('get', baseURI + '/manuscripts/vat-gr-754/authors-distinct', {
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