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




function router = |verb, request, response, data| {
    routes(httpParameters(verb, request, response, data))
}