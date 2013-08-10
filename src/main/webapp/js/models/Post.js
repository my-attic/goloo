App.Models.Post = Backbone.Model.extend({
    defaults : {
        content : null,
        file : null
    },
    initialize : function() {
        /*foo*/
    },
    fetch : function() {
        var selfModel = this;
        $.get("/posts/"+this.get("file"), function(markdownContent) {
            selfModel.set("content",markdown.toHTML(markdownContent));
            selfModel.trigger('postIsReady');
        })
    }
});

App.Collections.Posts = Backbone.Collection.extend({
    model:App.Models.Post,
    initialize : function() {
        this.counter = 0;
    },
    fetch : function() {
        var selfCollection = this;
        this.each(function(post) {
            selfCollection.listenTo(post,'postIsReady', selfCollection.onPostFetched)
            post.fetch()
        })
    },
    onPostFetched : function() {/* called each time a pot fetch is completed */
        this.counter+=1;
        if(this.counter==this.length) {
            console.log("==> All posts have been fetched!")
            this.trigger('allPostsAreReady')
        }
    }

});