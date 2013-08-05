$(function() {

    window.application = new App.Views.ApplicationView({
        //initialize properties
    });

    window.router = new App.Routers.MainRouter({application : application});

    //Backbone.history.start({pushState: true});
    Backbone.history.start();

});

