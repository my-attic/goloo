module controllers.hello

import core.http

function sayHello = |http| {
    #if "/" null pointer exception
    let choice = http:parameters():get(0)

    match {
        when choice:equals("html") then http:writeToHtml("<B>Hello Goloo</B>")
        when choice:equals("text") then http:writeToText("<B>Hello Goloo</B>")
        when choice:equals("xml") then
            http:writeToXml("""
                <note>
                    <to>Bob</to>
                    <from>Sam</from>
                    <heading>Reminder</heading>
                    <body>Don't forget me this weekend!</body>
                </note>
            """)
        otherwise http:writeToJson( map[["message",http:parameters()]] )
    }

}
