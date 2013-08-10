###Goloo Models and Collections  (backend)

    module models.human

    import core.models

    function Human = -> DynamicObject()
        :mixin(Model("human"))

    function Humans = -> DynamicObject()
        :mixin(Collection())
        :model(Human())


###Backbone Models and Collections (frontend)

    window.Human = Backbone.Model.extend({
        urlRoot : "/humans"
    });

    window.Humans = Backbone.Collection.extend({
        model : Human,
        url : "/humans"
    })

