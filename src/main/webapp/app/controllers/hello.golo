module controllers.hello

import core.json

function sayHello = |http| {
    #println("sayHello")
    http:contentType("application/json"):write(
        json():stringify(
            map[["message",http:parametersAfter("/hello/")]]
        )
    )

}