$(function() {

    window.application = new App.Views.ApplicationView({
        currentUser : new App.Models.AuthenticatedUser()

    });

    window.router = new App.Routers.MainRouter({application : application});

    //Backbone.history.start({pushState: true});
    Backbone.history.start();

});

