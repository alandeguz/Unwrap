//
//  UnwrapTests.swift
//  Unwrap
//
//  Created by John Holdsworth on 31/12/2020.
//  Copyright © 2020 John Holdsworth. All rights reserved.
//
//  $Id: //depot/Unwrap/Tests/UnwrapTests/UnwrapTests.swift#4 $
//

import Foundation
import Testing
import Unwrap

struct UnwrapTests {
    @Test
    func `Unwraps optional values`() throws {
        let value: String? = "value"
        #expect(forceUnwrap(value, "Should never be empty") == "value")
        #expect(try unwrap(value, "Should not be empty") == "value")

        let data: Data? = Data("value".utf8)
        let error: Error? = nil
        #expect(try data !! error == data)

        #if true
        func showUserHelpfulErrorMessageAndQuit() {
        }
        do { // Various invocations
            _ = try URL(string: "https://google.com") !! fatalError("WTF?")
            _ = try URL(string: "https://google.com") !! NSError(domain: "WTF", code: -2, userInfo: nil)
            _ = try URL(string: "https://google.com") !! { throw NSError(domain: "WTF", code: -2, userInfo: nil) }
            _ = try URL(string: "https://google.com") !! "WTF?"
            _ = try URL(string: "https://google.com") !! showUserHelpfulErrorMessageAndQuit()
            _ = try URL(string: "https://google.com").unwrapped(orThrow: fatalError("WTF?"))
            _ = try URL(string: "https://google.com").unwrapped(orThrow: NSError(domain: "WTF", code: -2, userInfo: nil))
            _ = try URL(string: "https://google.com").unwrapped(orThrow: { throw NSError(domain: "WTF", code: -2, userInfo: nil) })
            _ = try URL(string: "https://google.com").unwrapped(orThrow: "WTF?")
            _ = try URL(string: "https://google.com").unwrapped(orThrow:  showUserHelpfulErrorMessageAndQuit())
        } catch {}
        #endif

        let empty: String? = nil
        #expect(empty.unwrap(or: "OK") == "OK")
        #if false // These would be fatal
        _ = URL(static: "##", "URL test")
        _ = NSRegularExpression(static: "(", "Regex test")
        Issue.record("Should have trapped")
        #endif
    }
}
