module core.http

import core.json

struct httpParameters = {verb, request, response, data}

augment core.http.types.httpParameters {

    function userPrincipal = |this| -> this:request():getUserPrincipal()
    function uri = |this| -> this:request():getRequestURI()
    function route = |this| -> this:verb() + ":" + this:request():getRequestURI()
    function contentType = |this, content_type| {
        this:response():setContentType(content_type)
        return this
    }
    function write = |this, content| -> this:response():getWriter():println(content)
    function writeToJson = |this, content| -> this:contentType("application/json"):write(json():stringify(content))
    function writeToText = |this, content|-> this:contentType("text/plain"):write(content)
    function writeToHtml = |this, content|-> this:contentType("text/html"):write(content)
    function writeToXml  = |this, content|-> this:contentType("application/xml"):write(content)
    function parametersAfter = |this, partUri| -> java.net.URLDecoder.decode(this:uri():split(partUri):get(1))
    function parameters = |this| {
        let start = this:uri():split("/")
        if start:size() > 2 {
            let params = java.net.URLDecoder.decode(this:uri():split(start:get(1)+"/"):get(1))
            return params:split("/")
        } else {
            return array[]
        }

    }
    function dataToMap = |this| -> json():toMap(this:data())

    function GetOrPutOrDelete = |this, route, verb| {
        if route:contains(":var") {
            let start = verb + ":" + route:split(":var"):get(0)
            let endOfUri = this:route():split(start)
            if endOfUri:size() > 1 {
                if (start + endOfUri:get(1)):equals(this:route()) {
                    return true
                } else {
                    return false
                }
            } else {
                return false
            }
        } else {
            if this:route():equals(verb + ":" + route) or this:route():equals(verb + ":" + route + "/") {
                return true
            } else {
                return false
            }
        }
    }

    function GET = |this, route| {
        return this:GetOrPutOrDelete(route, "GET")
    }

    function PUT = |this, route| {
        return this:GetOrPutOrDelete(route, "PUT")
    }

    function DELETE = |this, route| {
        return this:GetOrPutOrDelete(route, "DELETE")
    }

    function POST = |this, route| {

        if this:route():equals("POST:" + route) or this:route():equals("POST:" + route + "/") {
            return true
        } else {
            return false
        }

    }

}

