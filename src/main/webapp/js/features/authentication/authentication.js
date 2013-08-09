App.Models.AuthenticatedUser = Backbone.Model.extend({

    /*
     loggedIn (boolean)
     logoutUrl
     loginUrl
     nickName
     admin (boolean)
     email
     id
     */
    urlRoot : "/login"
});

App.Views.AuthenticateView = Backbone.View.extend({
    el  : $(".authenticate-view"),
    tpl : $(".authenticate-view-template"),
    initialize : function () {
        this.template = _.template(this.tpl.html());
        this.listenTo(this.model, "sync", this.render)
    },
    render : function () {
        var renderedContent = this.template({ currentUser : this.model.toJSON() });
        this.$el.html(renderedContent);
        return this;
    }
});
