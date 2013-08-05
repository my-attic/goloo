module controllers.humans

import core.json

function humans = -> DynamicObject()
    :getAll(|this, http| {
        http:contentType("application/json")
        http:write(json():stringify(array[
            map[["firstName","Bob"],["lastName","Morane"]],
            map[["firstName","John"],["lastName","Doe"]],
            map[["firstName","Jane"],["lastName","Doe"]]
        ]))
    })
    :insert(|this, http| {
        http:contentType("application/json")
        println(http:data())
        let h = json():toMap(http:data())
        println(h:get("firstName"))
        println(h:get("lastName"))
        http:write(json():stringify(h))
    })