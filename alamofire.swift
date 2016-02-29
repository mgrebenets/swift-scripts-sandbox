#!/usr/bin/env xcrun swift -F Rome

import Alamofire
import Foundation

/// Helper for running Swift scripts with async callbacks
public class ScriptRunner {
	/// A poor man's mutex
	private var count = 0
	/// Current run loop
	private let runLoop = NSRunLoop.currentRunLoop()

	/// Lock the script
	public func lock() {
		count++
	}

	/// Unlock the script
	public func unlock() {
		count--
	}

	/// Wait for all locks to unlock
	public func wait() {
		while count > 0 &&
		    runLoop.runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 0.1)) {
		    // Run, run, run
		}
	}
}

var runner = ScriptRunner()
runner.lock()

Alamofire.request(.GET, "http://httpbin.org/get")
	.responseJSON { (_, _, JSON, _) in
		print(JSON, separator: "\n")
		runner.unlock()
	}

runner.wait()
// let runLoop = NSRunLoop.currentRunLoop()
// while shouldFinishRunning == false &&
//     runLoop.runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 0.1)) {
//     // Run, run, run
// }
// dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
print("EOF", separator: "\n")
