module core.json

struct json = {foo}

augment core.json.types.json {
    function toMap = |this, something|-> org.k33g.goloo.json.Json.fromJson(org.k33g.goloo.json.Json.parse(something), java.util.HashMap.class)
    function stringify = |this, something|-> org.k33g.goloo.json.Json.stringify(org.k33g.goloo.json.Json.toJson(something))
    function toJson = |this, something|-> org.k33g.goloo.json.Json.toJson(something)
    function fromJson = |this, something, klass| -> org.k33g.goloo.json.Json.fromJson(something, klass)
    function parse = |this, something| ->org.k33g.goloo.json.Json.parse(something)
}