#!/usr/bin/env xcrun swift -F Rome

import Alamofire
import Foundation

let url = NSURL(string: "http://httpbin.org/get")!
let data = NSData(contentsOfURL: url)!
// print(data)
let json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil) as? Dictionary<String, AnyObject>
// print(json)

// print("Try session")
// let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: nil, delegateQueue: NSOperationQueue())
// let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
// let session = NSURLSession()
// let task = session.dataTaskWithURL(url) { data, response, error in
//     print(data)
// }
// print("resume")
// task.resume()

// let configuration = NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier("com.example.app.background")
// let manager = Alamofire.Manager(configuration: configuration)

var shouldFinishRunning = false

Alamofire.request(.GET, "http://httpbin.org/get")
	.responseJSON { (_, _, JSON, _) in
		print(JSON)
		shouldFinishRunning = true
	}

let runLoop = NSRunLoop.currentRunLoop()
while shouldFinishRunning == false &&
    runLoop.runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 0.1)) {
    // Run, run, run
}
// dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
print("EOF")
