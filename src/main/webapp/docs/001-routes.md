###Goloo Routes (backend)

    module routes

    import core.http
    import core.authentication
    import controllers.humans

    function routes = |http| {

        match {
            when http:GET("/login")             then authentication():authenticate(http)
            when http:GET("/humans")            then humans.getAll(http)
            when http:GET("/humans/:var")       then humans.fetch(http)
            when http:POST("/humans")           then humans.insert(http)
            when http:PUT("/humans/:var")       then humans.update(http)
            when http:DELETE("/humans/:var")    then humans.delete(http)
            otherwise http:writeToJson( map[["message","404!"]] )
        }

    }

