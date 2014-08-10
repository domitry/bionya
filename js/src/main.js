define(function(require, exports, module){
    var Bionya = {};
    Bionya.Nya = {
        'scale':require('components/scale'),
        'axis':require('components/axis'),
        'diagrams': {
            'arc': require('diagrams/arc')
        }
    };

    return Bionya;
});
