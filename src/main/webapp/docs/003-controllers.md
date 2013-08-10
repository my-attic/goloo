###Goloo Controllers  (backend)

    module controllers.humans

    import core.users
    import core.http
    import core.security

    import models.human

    function getAll = |http| { # GET:/humans

        let humans = Humans():getAll(10)
        let humansList = list[]

        humans:models():each(|human| {
            humansList:add(human:getFields())
        })

        http:writeToJson(humansList)
    }

    function insert = |http| { # POST:/humans

        let h = http:dataToMap()

        let human = Human()

        human:setField("firstName", h:get("firstName"))
        human:setField("lastName", h:get("lastName"))
        human:setField("when", java.util.Date())

        human:save()
        http:writeToJson(human:getFields())
    }

    function fetch = |http| { # GET:/humans/:var

         let human = Human():getById(http:parameters():get(0))

         http:writeToJson(human:getFields())
    }


    function update = |http| {

        let h = http:dataToMap()
        let human = Human():getById(http:parameters():get(0))

        human:setField("firstName", h:get("firstName"))
        human:setField("lastName", h:get("lastName"))
        human:setField("when", java.util.Date())

        human:save()

        http:writeToJson(human:getFields())
    }

    function delete = |http| {

        # delete only if admin
        secure():admin({ # if current logged user is admin
            let human = Human():getById(http:parameters():get(0))
            human:delete()
            human:setField("deleted", true)
            http:writeToJson(human:getFields())
        },{ # if current logged user isn't admin
            http:writeToJson( map[["message","Don't even think about this!"]] )
        })
    }

    function query = |http| {

        let humansList = list[]

        Humans():select(10)
            :where("firstName"):isEqualTo("BOB")
                :models():each(|human| {
                    humansList:add(human:getFields())
                })

        http:writeToJson(humansList)
    }
