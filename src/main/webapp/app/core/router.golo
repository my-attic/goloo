module core.router

import routes

function httpParameters = |verb, request, response|->DynamicObject()
    :verb(verb)
    :request(request)
    :response(response)
    :define("uri", |this|->this:request():getRequestURI())
    :define("contentType", |this, content_type|->this:response():setContentType(content_type))
    :define("write", |this, content|->this:response():getWriter():println(content))

# InputStreamReader reader = new InputStreamReader(req.getInputStream(), Charsets.UTF_8);
# String code = CharStreams.toString(reader);

function router = |verb, request, response| {
    routes(httpParameters(verb, request, response))
    #TODO: querystring, data
}