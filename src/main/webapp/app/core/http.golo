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
    function dataToMap = |this| -> json():toMap(this:data())
}