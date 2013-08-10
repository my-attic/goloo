App.Views.IntroductionView = Backbone.View.extend({
    el  : $(".introduction-view"),
    tpl : $(".introduction-view-template"),
    initialize : function () {
        this.template = _.template(this.tpl.html());
        this.listenTo(this.collection, "allIntrosAreReady", this.render)
    },
    render : function () {
        var renderedContent = this.template({ intros : this.collection.toJSON() });
        this.$el.html(renderedContent);
        return this;
    }
});


