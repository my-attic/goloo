module routes

import core.http
import controllers.humans
import controllers.authentication
import controllers.hello


#=== ROUTES ===
function routes = |http| {

    println("========================================")
    println("http:verb() : " + http:verb())
    println("http:uri() : " + http:uri())
    println("http:route() : " + http:route())
    println("========================================")

    match {
        when http:route():equals("GET:/test") then humans():test(http)
        when http:route():equals("GET:/login") then authentication():authenticate(http)
        when http:route():equals("GET:/humans") then humans():getAll(http)
        when http:route():startsWith("GET:/humans/") then humans():fetch(http)
        when http:route():equals("POST:/humans") then humans():insert(http)
        when http:route():startsWith("PUT:/humans") then humans():update(http)
        when http:route():startsWith("DELETE:/humans/") then humans():delete(http)
        when http:route():startsWith("GET:/hello/") then sayHello(http)
        otherwise http:writeToJson( map[["message","404!"]] )
    }

    # $.ajax({type:"GET",url:"/humans",success:function(data){console.log(data)}})
    # $.ajax({type:"POST",url:"/humans",data:'{"firstName":"John", "lastName":"Doe"}',success:function(data){console.log(data)}})

}


