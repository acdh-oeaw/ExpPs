'use strict';
const mocha = require('mocha');
const chakram = require('chakram');
const assert = require('chai').assert;
const request = chakram.request;
const expect = chakram.expect;

module.exports = function(baseURI){
	describe('Tests for /commentaryfragments', function(){
		describe('Tests for list of commentaryfragments from all manuscripts', function(){
			it('Should response 200 for "OK"',function(){
				var response = request('get', baseURI + '/commentaryfragments', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.status(200);
				return chakram.wait();
			});
        });
        describe('Tests for /commentaryfragments/{$commentaryfragment-id}', function(){
			it('Should response with a particular commentaryfragment',function(){
				var response = request('get', baseURI + '/commentaryfragments/vat-gr-754-fr-1-1', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.json({ "_links" : { "self" : { "href" : "/psalmcatenae-server/commentaryfragments/vat-gr-754-fr-1-1"}, "psalm" : { "href" : "/psalmcatenae-server/psalmtexts/"}, "manuscript" : { "manuscript-identifier" : "Vat. gr. 754", "href" : "/psalmcatenae-server/manuscripts/vat-gr-754"}}, "_embedded" : { "commentaryfragment" : {"id" : "vat-gr-754-fr-1-1", "attribution" : "Anonymous", "source" : "Basilius, hom. in Ps. 48 (PG 29,436 C3–5) in Ps 48,5", "text" : "Ψαλτήριόν ἐστιν ὄργανον μουσικὸν ἐναρμονίους τοὺς φθόγγους πρὸς τὴν ἐκ τῆς φωνῆς  μελῳδίαν  ἀποδίδον: –"}} });
				return chakram.wait();
			});
        });
    });
    describe('Tests for /manuscripts/{$manuscript-name}/commentaryfragments', function(){
		describe('Tests for list of commentaryfragments from a particular manuscript', function(){
			it('Should response 200 for "OK"',function(){
				var response = request('get', baseURI + '/manuscripts/vat-gr-754/commentaryfragments', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.status(200);
				return chakram.wait();
		});
			it('Should response with a list of commentaryfragments of a particular manuscript',function(){
				var response = request('get', baseURI + '/manuscripts/vat-gr-754/commentaryfragments', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.be.an("object");
				return chakram.wait();
			});
            it('Should response with a particular commentaryfragment of a particular manuscript',function(){
				var response = request('get', baseURI + '/manuscripts/vat-gr-754/commentaryfragments/vat-gr-754-fr-1-5', {
					'headers': {"Accept":"application/hal+json",
								"Content-Type":"application/json"},
					'time': true
					});
				expect(response).to.have.json({ "_links" : { "self" : { "href" : "/psalmcatenae-server/manuscripts/vat-gr-754/commentaryfragments/vat-gr-754-fr-1-5"}, "psalm" : { "href" : "/psalmcatenae-server/vat-gr-754/psalmtexts/vat-gr-754-ps-1-3-1"}, "manuscript" : { "manuscript-identifier" : "Vat. gr. 754", "href" : "/psalmcatenae-server/manuscripts/vat-gr-754"}}, "_embedded" : { "commentaryfragment" : {"id" : "vat-gr-754-fr-1-5", "attribution" : "(Athanasius)", "source" : "Athanasius, exp. in Ps 1,3a", "text" : "Ξύλον ὁ  Χριστὸς  ἀναγέγραπται ἐν  τῇ  θε[ο]πνεύστῳ γραφῇ. κατὰ τὸ εἰρημένον. πᾶσι το[ῖς] [ἀν]τεχομένοις αὐτῆς· λέγει  οὖν ὅτι οἱ πιστεύσαντεςΧριστῷ. σῶμα αὐτοῦ ἔσοντ[αι]·  μετασχηματίσει  γὰρ τὸ  σῶμα  τῆς ταπεινώσεως ἡμῶν πρὸς τὸ γενέσθαι σύμ[μορ]φον   τῷ  σώματι τῆς δόξης αὐτοῦ· διεξόδους δὲ ὑδάτων. τὰ[ς] [θ]εί[α]ς γραφάς· ἐν αἷς [ἁ]πανταχοῦ ἔστιν ε[ὑ]ρεῖν  Χριστὸν  κηρυ[σσ]όμε[νον]: –"}} });
                return chakram.wait();
			});
        });
    });
}