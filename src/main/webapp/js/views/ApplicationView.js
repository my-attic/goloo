
//pattern application view §3.2.2
App.Views.ApplicationView = Backbone.View.extend({
    initialize : function(args) {
        //Set properties of the application view
        this.currentUser = args.currentUser;
        this.tips = args.tips;
        this.introductions = args.introductions;
        this.posts = args.posts;

        //Set Views
        this.authenticatedView = new App.Views.AuthenticatedView({model: this.currentUser });
        //Load user
        this.currentUser.fetch();

        this.introductionView = new App.Views.IntroductionView({collection:this.introductions})
        this.introductions.fetch();

        this.documentationView = new App.Views.DocumentationView({collection: this.tips});
        //Load documentation
        this.tips.fetch();

        this.blogView = new App.Views.BlogView({collection: this.posts});
        this.posts.fetch()


    },
    render : function() {
        /* ??? */
    },
    update : function() {

    }

});