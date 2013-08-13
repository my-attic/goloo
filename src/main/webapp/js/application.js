$(function() {
    //yes i know window, it's bad :p
    window.router = new App.Routers.MainRouter({

        applicationView : new App.Views.ApplicationView({

            currentUser : new App.Models.AuthenticatedUser(),

            tips : new App.Collections.Tips([
                new App.Models.Tip({file:"001-routes.md"}),
                new App.Models.Tip({file:"002-models.md"}),
                new App.Models.Tip({file:"003-controllers.md"})

            ]),
            introductions : new App.Collections.Introductions([
                new App.Models.Introduction({file:"000-stack.md"}),
                new App.Models.Introduction({file:"000-golo.md"})
            ]),
            posts : new App.Collections.Posts([ /* TODO: a counter ... */
                new App.Models.Post({file:"1-post.md"}),
                new App.Models.Post({file:"0-post.md"})
            ])
        })

    });


    router.on('route:hello', function(){

    });

    router.on('route:hi', function () {

    });

    router.on('route:defaultAction', function (actions) {
        // We have no matching route, lets refresh something ...
        this.applicationView.render();

    });

    //Backbone.history.start({pushState: true});
    Backbone.history.start();

    /*--- About the future demo ---

        yes i know window, it's bad :p
    */


    window.Human = Backbone.Model.extend({
        urlRoot : "/humans"
    });

    window.Humans = Backbone.Collection.extend({
        model : Human,
        url : "/humans"
    })

});
