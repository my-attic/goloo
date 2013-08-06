module routes

import core.json
import controllers.humans


#=== ROUTES ===
function routes = |http| {

    println("========================================")
    println("http:verb() : " + http:verb())
    println("http:uri() : " + http:uri())
    println("http:route() : " + http:route())
    println("========================================")

    match {
        when http:route():equals("GET:/humans") then humans():getAll(http)
        when http:route():equals("POST:/humans") then humans():insert(http)
        otherwise http:contentType("application/json"):write(json():stringify(map[["message","404!"]]))
    }

    # $.ajax({type:"GET",url:"/humans",success:function(data){console.log(data)}})
    # $.ajax({type:"POST",url:"/humans",data:'{"firstName":"John", "lastName":"Doe"}',success:function(data){console.log(data)}})

}


