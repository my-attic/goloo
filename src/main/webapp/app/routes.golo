module routes

import core.http
import core.authentication

import controllers.humans
import controllers.hello

#=== ROUTES ===
function routes = |http| {

    println("========================================")
    println("http:verb() : " + http:verb())
    println("http:uri() : " + http:uri())
    println("http:route() : " + http:route())
    println("========================================")

    match {
        when http:GET("/test")              then humans.test(http)
        when http:GET("/login")             then authentication():authenticate(http)
        when http:GET("/humans")            then humans.getAll(http)
        when http:GET("/humans/:var")       then humans.fetch(http)
        when http:POST("/humans")           then humans.insert(http)
        when http:PUT("/humans/:var")       then humans.update(http)
        when http:DELETE("/humans/:var")    then humans.delete(http)
        when http:GET("/hello/:var")        then hello.sayHello(http)
        otherwise http:writeToJson( map[["message","404!"]] )
    }

    # $.ajax({type:"GET",url:"/humans",success:function(data){console.log(data)}})
    # $.ajax({type:"POST",url:"/humans",data:'{"firstName":"John", "lastName":"Doe"}',success:function(data){console.log(data)}})

}


