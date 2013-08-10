App.Models.Tip = Backbone.Model.extend({
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
            selfModel.trigger('tipReady2BeDisplayed');
        })
    }
});

App.Collections.Tips = Backbone.Collection.extend({
    model:App.Models.Tip,
    initialize : function() {
        this.counter = 0;
    },
    fetch : function() {
        var selfCollection = this;
        this.each(function(tip) {
            selfCollection.listenTo(tip,'tipReady2BeDisplayed', selfCollection.onTipFetched)
            tip.fetch()
        })
    },
    onTipFetched : function() {/* called each time a tip fetch is completed */
        this.counter+=1;
        if(this.counter==this.length) {
            console.log("==> All tips have been fetched!")
            this.trigger('allTipsAreReady')
        }
    }

});
