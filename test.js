var baseURI = 'http://localhost:8984/psalmcatenae-server'

require('./test/utilSetup')

describe('Psalmcatenae Server Tests', function() {
    this.timeout(20000);
    describe('Get list of manuscripts', require('./test/manuscripts-test').curry(baseURI));
    describe('Get list of attributed authors', require('./test/authors-test').curry(baseURI));
    describe('Get list of critical assigned authors', require('./test/authors-critical-test').curry(baseURI));
    describe('Get commentaryfragments', require('./test/commentaryfragments-test').curry(baseURI));
    describe('Get glosses', require('./test/glosses-test').curry(baseURI));
    describe('Get hexaplaric variants', require('./test/hexaplaric-variants-test').curry(baseURI));
})