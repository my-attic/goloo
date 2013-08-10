App.Views.AuthenticatedView = Backbone.View.extend({
    el  : $(".authenticated-view"),
    tpl : $(".authenticated-view-template"),
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