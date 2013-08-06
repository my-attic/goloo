module controllers.humans

import core.data

function humans = -> DynamicObject()
    :getAll(|this, http| { # GET:/humans

        let humans = Store():query("human", 10)
        let humansArray = list[]
        humans:each(|human| {
            println(human:getProperty("firstName")+" "+human:getProperty("lastName"))
            humansArray:add(human:getProperties())
        })

        http:writeToJson(humansArray)
    })
    :insert(|this, http| { # POST:/humans

        let h = http:dataToMap()

        println(h:get("firstName"))
        println(h:get("lastName"))

        let datastore = Store()

        let human = datastore:entity("human")

        human:setProperty("firstName", h:get("firstName"))
        human:setProperty("lastName", h:get("lastName"))
        human:setProperty("when", java.util.Date())

        datastore:put(human)

        http:writeToJson(human:getProperties())
    })
    :fetch(|this, http| { # GET:/humans/:id
        let id = http:parametersAfter("/humans/")

        let human = Store():getById("human", id)

        http:writeToJson(human:getProperties())
    })
    :update(|this, http| {
        let id = http:parametersAfter("/humans/")
        let h = http:dataToMap()

        let datastore = Store()

        let human = datastore:getById("human", id)

        human:setProperty("firstName", h:get("firstName"))
        human:setProperty("lastName", h:get("lastName"))
        human:setProperty("when", java.util.Date())

        datastore:put(human)

        http:writeToJson(human:getProperties())
    })
    :delete(|this, http| {
        let id = http:parametersAfter("/humans/")
        let datastore = Store()
        let human = datastore:getById("human", id)

        datastore:delete(human)

        human:setProperty("deleted", true)

        http:writeToJson(human:getProperties())
    })

