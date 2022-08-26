Function.prototype.curry = function() {       
    function toArray(enm) {
        return Array.prototype.slice.call(enm);
    }
    if (arguments.length < 1) {
        return this;
    }
    var method = this;
    var args = toArray(arguments);
    return function() {
        return method.apply(this, args.concat(toArray(arguments)));
    }
}
        
module.exports = function(){};