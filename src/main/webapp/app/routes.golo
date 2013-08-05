module routes

import core.json
import controllers.humans

function routes = |http| {

    http:contentType("application/json")

    println("========================================")
    println("http:verb() : " + http:verb())
    println("http:uri() : " + http:uri())
    println("========================================")


    #when route: startsWith("GET:/tinytoons/")   then tinyToons(): getById(httpConnection)
    #when route: equals("GET:/tinytoons")        then tinyToons(): getAll()
    #when route: equals("POST:/tinytoons")       then tinyToons(): create(httpConnection)
    #when route: startsWith("PUT:/tinytoons")    then tinyToons(): update(httpConnection)
    #when route: startsWith("DELETE:/tinytoons") then tinyToons(): delete(httpConnection)

    #when route: startsWith("GET:/start/tinytoons/")   then tinyToons(): start(httpConnection)
    #when route: equals("GET:/listen/tinytoons")       then tinyToons(): listen(httpConnection)
    #otherwise null




    # $.ajax({type:"GET",url:"/humans",success:function(data){console.log(data)}})
    if http:verb() == "GET" {
        if http:uri() == "/humans" {
            http:write(json():stringify(array[
                map[["firstName","Bob"],["lastName","Morane"]],
                map[["firstName","John"],["lastName","Doe"]],
                map[["firstName","Jane"],["lastName","Doe"]]
            ]))
        } else {
            http:write(json():stringify(
                map[["verb",http:verb()],["uri",http:uri()]]
            ))
        }
    }

    # $.ajax({type:"POST",url:"/humans",data:'{"firstName":"John", "lastName":"Doe"}',success:function(data){console.log(data)}})

    if http:verb() == "POST" {

        if http:uri() == "/humans" {
            println(http:data())
            let h = json():toMap(http:data())

            println(h:get("firstName"))
            println(h:get("lastName"))

            http:write(json():stringify(h))
        }
    }

}
