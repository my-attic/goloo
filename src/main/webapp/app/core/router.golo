module core.router

import core.http
import routes
import core.json



#function httpParameters = |verb, request, response, data|->DynamicObject()
#    :verb(verb)
#    :userPrincipal(request:getUserPrincipal())
#    :request(request)
#    :response(response)
#    :data(data)
#    :uri(request:getRequestURI())
#    :route(verb+":"+request:getRequestURI())
#    :define("contentType", |this, content_type| {
#        this:response():setContentType(content_type)
#        return this
#    })
#    :define("write", |this, content|->this:response():getWriter():println(content))
#    :define("writeToJson", |this, content|-> this:contentType("application/json"):write(json():stringify(content)))
#    :define("writeToHtml", |this, content|-> this:contentType("text/html"):write(content))
#    :define("writeToText", |this, content|-> this:contentType("text/plain"):write(content))
#    :define("writeToXml", |this, content|-> this:contentType("application/xml"):write(content))
#    :define("parametersAfter", |this, partUri| {
#        return java.net.URLDecoder.decode(this:uri():split(partUri):get(1))
#    })
#    :define("dataToMap", |this| -> json():toMap(this:data()))

# Called by RunServlet.java
function router = |verb, request, response, data| {
    routes(httpParameters(verb, request, response, data))
}

    #"application/json"
    #"text/html"
    #"text/plain"
    #"text/event-stream"
    #"text/xml"
    #"application/xml"
    #"text/css"
    #"application/javascript"
