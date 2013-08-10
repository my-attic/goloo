App.Models.Introduction = Backbone.Model.extend({
    defaults : {
        content : null,
        file : null
    },
    initialize : function() {
        /*foo*/
    },
    fetch : function() {
        var selfModel = this;
        $.get("/docs/"+this.get("file"), function(markdownContent) {
            selfModel.set("content",markdown.toHTML(markdownContent));
            selfModel.trigger('introIsReady');
        })
    }
});

App.Collections.Introductions = Backbone.Collection.extend({
    model:App.Models.Introduction,
    initialize : function() {
        this.counter = 0;
    },
    fetch : function() {
        var selfCollection = this;
        this.each(function(intro) {
            selfCollection.listenTo(intro,'introIsReady', selfCollection.onIntroductionFetched)
            intro.fetch()
        })
    },
    onIntroductionFetched : function() {/* called each time an intro fetch is completed */
        this.counter+=1;
        if(this.counter==this.length) {
            console.log("==> All intros have been fetched!")
            this.trigger('allIntrosAreReady')
        }
    }

});