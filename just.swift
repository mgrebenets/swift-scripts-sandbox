#!/usr/bin/env xcrun swift -F Rome

// import Argo
// import Runes
import PrettyColors
// import Alamofire
import CLIKit
import Just

typealias JSON = Dictionary<String, AnyObject>

struct Response {
	let acceptHeader: String

	init(json: JSON) {
		let headers = json["headers"] as! JSON
		acceptHeader = headers["Accept"] as! String
	}
}

let json = Just.get("http://httpbin.org/get").json as? JSON

println(json)

if let json = json {
	let response = Response(json: json)
}


// let group = dispatch_group_create()
// dispatch_group_enter(group)
// println("hehe")
//
// let semaphore = dispatch_semaphore_create(0);
// Alamofire.request(.GET, "http://httpbin.org/get")
// 	.responseJSON { (_, _, JSON, _) in
// 		println("whoa")
// 		// fatalError("fail")
// 		println(JSON)
// 		// dispatch_group_leave(group)
// 		dispatch_semaphore_signal(semaphore)
// 	}
//
// println("wait for dispatch group")
//  dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
// dispatch_group_wait(group, DISPATCH_TIME_FOREVER)

// var manager = Manager()
//
// manager.register("xcbot", "Options:") { argv in
// 	print("blah")
// }
// manager.register("list", "List Xcode bots") { argv in
// 	print("hha")
// }

let redText: String = Color.Wrap(foreground: .Red).wrap("Roses are red")
let blueText: String = Color.Wrap(foreground: .Blue).wrap("Violets are blue")
let blackText: String = Color.Wrap(foreground: .Black).wrap("But I can’t rhyme")
let moreBlueText: String = Color.Wrap(foreground: .Blue).wrap("So here’s more blue")

// println(redText)
// println(blueText)
// println(blackText)
// println(moreBlueText)
