#!/usr/bin/env xcrun swift -F Rome

import Foundation
import Alamofire
import SwiftScriptRunner

var runner = SwiftScriptRunner()
runner.lock()

print("Main thread: \(NSThread.isMainThread())", separator: "\n")

Alamofire.request(.GET, "http://httpbin.org/get", parameters: ["foo": "bar"])
         .responseJSON { response in
             print(response.request)  // original URL request
             print(response.response) // URL response
             print(response.data)     // server data
             print(response.result)   // result of response serialization

            print("Main thread: \(NSThread.isMainThread())", separator: "\n")

             if let JSON = response.result.value {
                 print("JSON: \(JSON)")
             }

			 runner.unlock()
         }

// runner.wait()
// let runLoop = NSRunLoop.currentRunLoop()
// while shouldFinishRunning == false &&
//     runLoop.runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 0.1)) {
//     // Run, run, run
// }
// dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
print("EOF", separator: "\n")
