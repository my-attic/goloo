App.Routers.MainRouter = Backbone.Router.extend({
    initialize : function(args){
        this.applicationView = args.applicationView
        if (!this.applicationView) throw 'Requires an applicationView instance'
    },
    routes : {
        // Define some URL routes
          'hello': 'hello'
        , 'hi': 'hi'

        // Default
        , '*actions': 'defaultAction'
    }

});
