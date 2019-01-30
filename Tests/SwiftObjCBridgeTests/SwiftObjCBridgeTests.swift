//
//  Created by Helge Heß on 2019-01-30.
//  Copyright © 2019 ZeeZide GmbH. All rights reserved.
//
import XCTest
@testable import SwiftObjCBridge

final class SwiftObjCBridgeTests: XCTestCase {
  
    func testClassLookup() throws {
        let udc = ObjC.NSUserDefaults
        XCTAssertNotNull(udc)
    }
    
    func testClassMethodLookup() throws {
        let call = ObjC.NSUserDefaults.alloc // <= No () yet!
        print("Callable:", call)
        XCTAssertNotNull(call)
    }
    
    func testClassMethodInvocation() throws {
        let udNew = ObjC.NSUserDefaults.alloc() // <= Now with () !
        print("instance:", udNew)
        XCTAssertNotNull(udNew)
    }
    func testClassMethodInvocation2() throws {
        let ud = ObjC.NSUserDefaults.standardUserDefaults()
        print("instance:", ud)
        XCTAssertNotNull(ud)
    }
    
    func testInstanceMethodInvocation() throws {
        let ud = ObjC.NSUserDefaults.standardUserDefaults()
        let domains = ud.volatileDomainNames()
        XCTAssertNotNull(domains)
    }
    
    func testMethodWithArg() throws {      
        let ma  = ObjC.NSArray.alloc().`init`()
        let ma2 = ma.arrayByAddingObject("Hello")
        print("★:", ma2)
    }
    
    func testCallableClass() throws {
        let ms = ObjC.NSMutableArray()
        ms.addObject("Happy")
        ms.addObject("Birthday")
        print("★★★:", ms)      
    }

    static var allTests = [
      ("testClassLookup",              testClassLookup),
      ("testClassMethodLookup",        testClassMethodLookup),
      ("testClassMethodInvocation",    testClassMethodInvocation),
      ("testClassMethodInvocation2",   testClassMethodInvocation2),
      ("testInstanceMethodInvocation", testInstanceMethodInvocation),
      ("testMethodWithArg",            testMethodWithArg),
    ]
}
