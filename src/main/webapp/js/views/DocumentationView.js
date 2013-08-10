App.Views.DocumentationView = Backbone.View.extend({
    el  : $(".documentation-view"),
    tpl : $(".documentation-view-template"),
    initialize : function () {
        this.template = _.template(this.tpl.html());
        this.listenTo(this.collection, "allTipsAreReady", this.render)
    },
    render : function () {
        var renderedContent = this.template({ tips : this.collection.toJSON() });
        this.$el.html(renderedContent);

        $('code').each(function(){
            $(this).attr('data-language','coffeescript');
        });

        Rainbow.color();

        return this;
    }
});
