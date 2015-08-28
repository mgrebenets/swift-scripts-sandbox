#!/usr/bin/env xcrun swift -F Rome

import Foundation
import XcodeServerSDK

do {
	let config = try XcodeServerConfig(host: "https://127.0.0.1", user: "mobile", password: "mobile")
	let server = XcodeServerFactory.server(config)
	print(server)

	let semaphore = dispatch_semaphore_create(0)

dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
	server.getBots { (bots, error) -> () in
		print("never:(")
	    if let error = error {
			print("why")
	        Log.error("Oh no! \(error.description)")
			dispatch_semaphore_signal(semaphore)
	        return
	    }

		print(bots)
	    // go crazy with bots
	    if let firstBot = bots?.first {
	        // use the first bot...
			print("First bot: \(firstBot)")
	    }

		dispatch_semaphore_signal(semaphore)

	}
// dispatch_semaphore_signal(sem)
}

	print("wait")
	dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
} catch let error {
	print(error)
}



print("xcode")
