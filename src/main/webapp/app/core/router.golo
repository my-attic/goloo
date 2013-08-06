module core.router

import routes

function httpParameters = |verb, request, response, data|->DynamicObject()
    :verb(verb)
    :request(request)
    :response(response)
    :data(data)
    :uri(request:getRequestURI())
    :route(verb+":"+request:getRequestURI())
    :define("contentType", |this, content_type| {
        this:response():setContentType(content_type)
        return this
    })
    :define("write", |this, content|->this:response():getWriter():println(content))
    :define("parametersAfter", |this, partUri| {
        #println("URI : " + this:uri())
        return java.net.URLDecoder.decode(this:uri():split(partUri):get(1))
    })




function router = |verb, request, response, data| {
    routes(httpParameters(verb, request, response, data))
}
