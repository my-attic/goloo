
//pattern application view §3.2.2
App.Views.ApplicationView = Backbone.View.extend({
    initialize : function(args) {
        //Set properties of the application view
        this.currentUser = args.currentUser;

        //Set Views
        this.authenticateView = new App.Views.AuthenticateView({model: this.currentUser });


        //Load data
        this.currentUser.fetch();


    },
    update : function() {

    }

});