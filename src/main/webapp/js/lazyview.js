/*---TOOLS 4 to kill bb boilerplates ---*/

Backbone.LazyView = Backbone.View.extend({
    initialize : function(args) {
        for(var m in args) {
            this[m]=args[m]
        }
        if(!this.template) throw "this view needs a 'template' property"
        this.generate = _.template(this.template.toString().split("/*")[1].split("*/")[0])
        if(this.initialized) this.initialized(args)
    },
    display : function(args) {
        for(var m in args) {
            if(args[m].toJSON) {args[m]=args[m].toJSON();}
        }
        this.$el.html(this.generate(args));
    },
    getValue : function(selector) {
        return this.$el.find(selector).val();
    }
    ,
    getText : function(selector) {
        return this.$el.find(selector).text();
    },
    getHashValue : function(e) {
        return e.target.hash.split("#")[1];
    },
    getDataValue : function(e) {
        return e.target.dataset.value;
    },
    getData : function(what, e) {
        return e.target.dataset[what];
    }
})

