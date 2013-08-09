module models.human

import core.models

function Human = -> DynamicObject()
    :mixin(Model("human"))

function Humans = -> DynamicObject()
    :mixin(Collection())
    :model(Human())