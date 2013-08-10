App.Views.BlogView = Backbone.View.extend({
    el  : $(".blog-view"),
    tpl : $(".blog-view-template"),
    initialize : function () {
        this.template = _.template(this.tpl.html());
        this.listenTo(this.collection, "allPostsAreReady", this.render)
    },
    render : function () {
        var renderedContent = this.template({ posts : this.collection.toJSON() });
        this.$el.html(renderedContent);
        return this;
    }
});


