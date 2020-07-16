import Vapor

struct Greeting: Content {
    var hello: String
}

struct HTML {
  let value: String
}

extension HTML: ResponseEncodable {
  public func encodeResponse(for request: Request) -> EventLoopFuture<Response> {
    var headers = HTTPHeaders()
    headers.add(name: .contentType, value: "text/html")
    return request.eventLoop.makeSucceededFuture(.init(
      status: .ok, headers: headers, body: .init(string: value)
    ))
  }
}

struct Suggestion: Content {
    var id: Int?
    var name: String
    var description: String
    var price: Int
}
