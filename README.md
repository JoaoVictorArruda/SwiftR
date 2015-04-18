# SwiftR
Swift client for SignalR. A work in progress.

### Simple Example
```c#
// Server
public class SimpleHub : Hub 
{
    public void SendSimple(string message, detail)
    {
        Clients.All.notifySimple (message, detail);
    }
}
```

```swift
// Client
SwiftR.connect("http://localhost:8080") { (connection) in
    let simpleHub = connection.createHubProxy("simpleHub")
  
    // Event handler
    simpleHub.on("notifySimple") { (response) in
        let message = response!["0"] as! String
        let detail = response!["1"] as! String
        println("Message: \(message)\nDetail: \(detail)")
    }
}
```

### Complex Example
```c#
// Server
public class ComplexMessage
{
    public int MessageId { get; set; }
    public string Message { get; set; }
    public string Detail { get; set; }
    public IEnumerable<String> Items { get; set; }
}

// Server
public class ComplexHub : Hub
{
	  public void SendComplex(ComplexMessage message) 
	  {
		    Clients.All.notifyComplex (message);
	  }
}
```

```swift
var complexHub: Hub!

SwiftR.connect("http://localhost:8080") { (connection) in
    self.complexHub = connection.createHubProxy("complexHub")
    
    self.complexHub.on("notifyComplex") { (response) in
        let m: AnyObject = response!["0"] as AnyObject!
        println(m)
    }
}

let message = [
    "messageId": 1,
    "message": "Complex Test",
    "detail": "This is a complex message",
    "items": ["foo", "bar", "baz"]
]

// Invoke server method
complexHub.invoke("sendComplex", parameters: [message])