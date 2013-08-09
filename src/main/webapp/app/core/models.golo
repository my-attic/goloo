module core.models

import core.data

function Model = |kind| {
    let m = DynamicObject()
        :define("getField", |this, fieldName|{
            return this:entity():getProperty(fieldName)
        })
        :define("setField", |this, fieldName, value|{
            this:entity():setProperty(fieldName, value)
            return this
        })
        :define("getFields", |this|{
            return this:entity():getProperties()
        })
        :define("save", |this| {
            this:datastore():put(this:entity())
        })
        :define("getById", |this, id| {
            this:entity(this:datastore():getById(this:kind(), id))
            return this
        })
        :define("delete", |this| {
            this:datastore():delete(this:entity())
        })

    m:kind(kind)
    m:datastore(Store())
    m:entity(m:datastore():entity(kind))

    println(m:entity())

    return m
}

#Store():get("human",10):where("firstName"):isEqualTo("BOB")

function Collection =  {
    let c = DynamicObject()
        :define("getAll", |this, limit| {
            let entities = this:model():datastore():getAll(this:model():kind(), limit)
            entities:each(|human| {
                var m = DynamicObject():mixin(this:model())
                m:entity(human)
                this:models():add(m)
            })
            return this
        })
        :define("select", |this, limit| {
            this:limit(limit)
            return this
        })
        :define("where", |this, fieldName| {
            this:field(fieldName)
            return this
        })
        :define("isEqualTo", |this, value| {
            let entities = this:model():datastore():get(this:model():kind(), this:limit()):where(this:field()):isEqualTo(value)
            entities:each(|human| { #TODO : HAVE TO BE FACTORIZED
                var m = DynamicObject():mixin(this:model())
                m:entity(human)
                this:models():add(m)
            })
            return this
        })

        #TODO other request + offset


    c:models(list[])
    return c
}