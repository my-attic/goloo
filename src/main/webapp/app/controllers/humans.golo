module controllers.humans


import core.data

function humans = -> DynamicObject()
    :getAll(|this, http| {

        http:writeToJson(array[
            map[["firstName","Bob"],["lastName","Morane"]],
            map[["firstName","John"],["lastName","Doe"]],
            map[["firstName","Jane"],["lastName","Doe"]]
        ])
    })
    :insert(|this, http| {

        println(http:data())

        let h = http:dataToMap()

        println(h:get("firstName"))
        println(h:get("lastName"))

        let datastore = Store():service()

        let human = Store():entity("human")

        human:setProperty("firstName", h:get("firstName"))
        human:setProperty("lastName", h:get("lastName"))
        human:setProperty("when", java.util.Date())
        human:setProperty("id", java.util.UUID.randomUUID():toString())

        datastore:put(human)

        http:writeToJson(human:getProperties())
    })

