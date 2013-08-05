module routes

import core.json

function routes = |http| {

    println("+++=== ROUTES ===+++")


    println(http:verb())
    println(http:uri())
    http:contentType("application/json")
    http:write(json():stringify(map[["firstName","Bob"],["lastName","Morane"]]))


    # $.ajax({type:"GET",url:"/humans",success:function(data){console.log(data)}})
    # $.ajax({type:"POST",url:"/humans",data:{firstName:"John", lastName:"Doe"},success:function(data){console.log(data)}})
}
