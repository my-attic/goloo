
//pattern application view §3.2.2
App.Views.ApplicationView = Backbone.View.extend({
    initialize : function(args) {
        //Set properties of the application view

        var selfAppView = this;

        this.currentUser = args.currentUser;
        this.tips = args.tips;
        this.introductions = args.introductions;
        this.posts = args.posts;

        this.introductionView = new App.Views.IntroductionView({collection:this.introductions})
        this.documentationView = new App.Views.DocumentationView({collection: this.tips});
        this.blogView = new App.Views.BlogView({collection: this.posts});
        this.authenticatedView = new App.Views.AuthenticatedView({model: this.currentUser });

        $("#loading").html("Loading data, please wait ...")

        this.listenTo(this.introductions,'allIntrosAreReady',function(){
            $("#loading").html("Introduction loaded ...")
            selfAppView.tips.fetch();
        })

        this.listenTo(this.tips,'allTipsAreReady',function(){
            $("#loading").html("Tips loaded ...")
            selfAppView.posts.fetch();
        })

        this.listenTo(this.posts,'allPostsAreReady',function(){
            $("#loading").html("blog loaded ... Searching authenticated user ...")
            selfAppView.currentUser.fetch();
        })

        this.listenTo(this.currentUser,'sync',function(){
            $("#loading").html("All contents loaded!");
            $("#loading").hide();
        })

        this.introductions.fetch();

    },
    render : function() {
        /* ??? */
    },
    update : function() {

    }

});