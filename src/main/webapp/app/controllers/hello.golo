module controllers.hello

function sayHello = |http| {

    http:writeToJson( map[["message",http:parametersAfter("/hello/")]] )

}