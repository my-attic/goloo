module controllers.hello

import core.http

function sayHello = |http| {
    let choice = http:parametersAfter("/hello/")

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
        otherwise http:writeToJson( map[["message",http:parametersAfter("/hello/")]] )
    }

}
