module controllers.simple

import core.http

function simpleWithParams = |http| {
    println("Philippe Charriere")
    http:writeToJson( map[["parameters",http:parameters()]] )

}

function simple = |http| {

    http:writeToJson( map[["parameters","peanuts"]] )

}
