//
//  Created by Helge Heß on 2019-01-30.
//  Copyright © 2019 ZeeZide GmbH. All rights reserved.
//
import XCTest
@testable import SwiftObjCBridge

final class SwiftObjCBridgeTests: XCTestCase {
  
    func testClassLookup() throws {
        let udc = ObjC.NSUserDefaults
        XCTAssertNotNil(udc.handle)
    }
    
    func testClassMethodLookup() throws {
        let call = ObjC.NSUserDefaults.alloc // <= No () yet!
        print("Callable:", call)
        XCTAssertNotNil(call.instance.handle)
        XCTAssertEqual(call.baseName, "alloc")
    }
    
    func testClassMethodInvocation() throws {
        let udNew = ObjC.NSUserDefaults.alloc() // <= Now with () !
        print("instance:", udNew)
        XCTAssertNotNil(udNew.handle)
    }
    func testClassMethodInvocation2() throws {
        let ud = ObjC.NSUserDefaults.standardUserDefaults()
        print("instance:", ud)
        XCTAssertNotNil(ud.handle)
    }
    
    func testInstanceMethodInvocation() throws {
        let ud = ObjC.NSUserDefaults.standardUserDefaults()
        let domains = ud.volatileDomainNames()
        XCTAssertNotNil(domains.handle)
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
