import Vapor

func routes(_ app: Application) throws {
    //Cannot infer - make future view output to return when templates from
    //Leaf are rendered.
    app.get { req -> EventLoopFuture<View> in
        let badSuggestion = Suggestion(id: 1, name: "Bad Suggestion", description: "I make a bad suggestion", price: 3)
        let goodSuggestion = Suggestion(id: 2, name: "Good Suggestion", description: "I make a good suggestion", price: 30)
        //Call leaf template
        return req.view.render("home", ["suggestions": [badSuggestion, goodSuggestion]])
    }

    app.post("add") { req -> Suggestion in
        let suggestion = try req.content.decode(Suggestion.self)
        print(suggestion)
        return suggestion
    }
/*
    app.post("greeting") { req -> String in
        let greeting = try req.content.decode(Greeting.self)
        print(greeting.hello) // "world"
        return greeting.hello
    }

    app.get("hello", ":name") { _ in
        HTML(value: """
        <html>
          <body>
            <h1>Hello, World!</h1>
          </body>
        </html>
        """)
    }
*/
}
