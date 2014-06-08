//
//  Basics.swift
//  SwiftLanguage
//
//  Created by Rodney Degracia on 6/6/14.
//  Copyright (c) 2014 Venture Intellectual LLC. All rights reserved.
//

import XCTest

class Basics: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConstantsAndVariables() {
        let a = 3
        let a1: NSNumber = NSNumber(int: 3)
        XCTAssert(a == 3, "a should equal 3")
        XCTAssert(a1 == a, "a1 should equal a")
        
        let b = "3"
        XCTAssert(b == "3", "b should equal 3")
        
        var c = 4
        c = 5
        XCTAssert(c == 5, "c should equal 5")
        
        var d = "e"
        d = "f"
        XCTAssert(d == "f", "d should equal 'f' ")

        var x = 0.0, y = 0.0, z = 0.0
        XCTAssert(x == 0.0, "x should equal 0.0")
        XCTAssert(y == 0.0, "y should equal 0.0")
        XCTAssert(z == 0.0, "z should equal 0.0")
        
        // var x9 = 0.0, var y9 = 0.0, z9 = 0.0 ;   'let' cannot appear nested inside another 'var' or 'let' pattern
        
        // semicolon test
        x = 1.0 ; y = 1.0
        z = 1.0
        
        XCTAssert(x == 1.0, "x should equal 1.0")
        XCTAssert(y == 1.0, "y should equal 1.0")
        XCTAssert(z == 1.0, "z should equal 1.0")
        
        let x1 = 0.0, y1 = 0.0, z1 = 0.0
        // let x11 = 0.0, let y11 = 0.0, z11 = 0.0 ; 'let' cannot appear nested inside another 'var' or 'let' pattern
        
        
        XCTAssert(x1 == 0.0, "x1 should equal 0.0")
        XCTAssert(y1 == 0.0, "y1 should equal 0.0")
        XCTAssert(z1 == 0.0, "z1 should equal 0.0")
    }
    
    func testTypeAnnotations() {
        
        var a: Int = 1
        var b : Int = 2
        var c :Int = 3
        
        var a1: Int = Int(3.12)
        var a2: Float = Float(3.12)
        var a3: Double = Double(3.12)
        
        XCTAssert(a3 != a2, "Float(3.12) should not equal Double(3.12)")
        XCTAssert(a1 != a3, "Int(3.12) should not equal Double(3.12)")
        XCTAssert(a1 != a2, "Int(3.12) should not equal Float(3.12)")

    }
    
    func testNaming() {
        let π = 3.14159
        let 你好 = "你好世界"
        let 🐶🐮 = "dogcow"
        
        XCTAssert(π == 3.14159, "π should equal 3.14159")
        XCTAssert(你好 == "你好世界", "你好 should equal \"你好世界\"")
        XCTAssert(🐶🐮 == "dogcow", "🐶🐮 should equal  \"dogcow\"")
    }
    
    func testPrintLn() {
        let friendlyWelcome = "Hello world"
        println(friendlyWelcome)
    }
    
    func testIntegerBounds() {
        let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
        let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8
        
        XCTAssert(minValue == 0, "minValue should equal 0")
        XCTAssert(maxValue == 255, "maxValue should equal 255")
        
        XCTAssert(sizeof(Int32) == sizeof(Int), "size of Int32 should equal size of Int ")
        XCTAssert(sizeof(Int64) != sizeof(Int), "size of Int32 should equal size of Int , 32bit platform")
        
        XCTAssert(sizeof(UInt32) == sizeof(UInt), "size of Int32 should equal size of UInt ")
        XCTAssert(sizeof(UInt64) != sizeof(UInt), "size of Int64 should equal size of UInt , 32bit platform")
        
        XCTAssert(sizeof(Int32) == sizeof(Int), "size of Int64 should equal size of Int ")
        XCTAssert(sizeof(Int64) != sizeof(Int), "size of Int6 should equal size of Int , 32bit platform")
        XCTAssert(true, "Pass")
    }
    
    func testFloatingPoint() {
        let f1 = 3.12   // Default as Double
        let f11: NSNumber = NSNumber(double: 3.12)
        let f2: Double = 3.12
        
        XCTAssert(f1 == f2, "3.12 should equal Double(3.12)")
        XCTAssert(f1 == f11, "3.12 should equal NSNumber(double: 3.12)")
        XCTAssert(f11 == f2, "NSNumber(double: 3.12) should equal Double(3.12)")
    }
    
    
    func testtypeSafety() {
        
        let f1 = 3.12   // Default as Double
        let f11: NSNumber = NSNumber(double: 3.12)
        let f2: Double = 3.12
        
        // implicitly can be cast to Double or NSNumber
        f1 as Double
        f1 as NSNumber
        
        // NSNumber can only be cast into NSNumber
        f11 as NSNumber
        //f11 as Double    Cannot convert the expression's type 'Double' to type 'Double'
        
        // Double can be cast into Double or NSNumber
        f2 as Double
        f2 as NSNumber
        
        let f1string = (f1 as NSNumber).stringValue
        XCTAssert(f1string == "3.12", "(f1 as NSNumber).stringValue should equal \"3.12\"")
    }
    
    
    func testNumericLiterals() {
        // Numeric Literals
        
        let decimalInteger = 17
        let binaryInteger = 0b10001       // 17 in binary notation
        let octalInteger = 0o21           // 17 in octal notation
        let hexadecimalInteger = 0x11     // 17 in hexadecimal notation
        
        // Can cast to NSNUmber, but not Double
        binaryInteger as NSNumber
        octalInteger as NSNumber
        hexadecimalInteger as NSNumber
        
        var i_binaryInteger = (binaryInteger as NSNumber).integerValue
        XCTAssert(i_binaryInteger == 17, "(binaryInteger as NSNumber).integerValue is equal to 17")
        
        var i_octalInteger = (octalInteger as NSNumber).integerValue
        XCTAssert(i_octalInteger == 17, "(octalInteger as NSNumber).integerValue is equal to 17")
        
        var i_hexadecimalInteger = (hexadecimalInteger as NSNumber).integerValue
        XCTAssert(i_hexadecimalInteger == 17, "(hexadecimalInteger as NSNumber).integerValue is equal to 17")
        
    }
    
    
    func testNumericTypeConversion() {
        XCTAssert(sizeof(UInt8) < sizeof(UInt), "sizeof(UInt8) should be less than sizeof(UInt)")
        XCTAssert(sizeof(UInt16) < sizeof(UInt), "sizeof(UInt16) should be les than sizeof(UInt)")
        XCTAssert(sizeof(UInt32) == sizeof(UInt), "(sizeof(UInt32) should be equal to sizeof(UInt)")
        XCTAssert(sizeof(UInt64) > sizeof(UInt), "sizeof(UInt64) should be greater than sizeof(UInt)")
        
        let x64 = UInt64(UInt32(UInt16(UInt8(1))))
        XCTAssert( x64 == 1, "UInt64(UInt32(UInt16(UInt8(1)))) should equal 1")
        
        let x8  = UInt8(UInt16(UInt32(UInt64(1))))
        XCTAssert( UInt8(UInt16(UInt32(UInt64(1)))) == x8, "UInt8(UInt16(UInt32(UInt64(1)))) should equal 1")
        
    }
    
    func testIntegerFloatingPointConversion() {
        var xx = 3.0
        var yy = xx + 1
        yy as NSNumber
        yy as Double
        XCTAssert(xx + 1 == Int(xx) + 1, "3.0 + 1 should equal Int(3.0) + 1")
    }
    
    func testTypeAlias() {
        typealias YY = UInt16
        var YY1 = UInt8(YY(1))
        
        typealias ZZ = Double
        var ZZ1 = ZZ(1)
        
        var dd = ZZ1 as Double
        XCTAssert(dd == 1.0 , "dd should equal 1.0")
        XCTAssert( (ZZ1 as Double) == 1.0, "(ZZ1 as Double) should equal 1.0")
        
        ZZ1 as NSNumber
    }

    func testBooleans() {
        // Booleans
        
        var bool1 = Bool(1)
        bool1 == true
        !bool1 == !true
        
        // !!bool1 == !!true    Does not compile
        // !!true == !!bool1    Does not compile
        
        !(!true) == !(!bool1)
        
        var bool2 = Bool("a")
        XCTAssert(bool2 == true, "bool2 should be true")
        XCTAssert(!bool2 == !true, "not bool2 should be not true")
        XCTAssert(!(!bool2) == !(!true), "not not bool2 should equal not not true, with parens")
        
        var bool3 = Bool(!"a")
        XCTAssert(bool3 == false, "bool3 should be false")
        XCTAssert(!"a" == false, "!\"a\" should be false")
        XCTAssert(Bool("a") == true, "Bool(\"a\" should be true")
        XCTAssert(!Bool("a") == false, "not Bool(\"a\" should be not false")
        XCTAssert(!(!"a") == true, "not not \"a\" should be true")

    }
    
    func testTuples() {
        
        let tup1 = (1, 2, 3)
        XCTAssert(tup1.0 == 1, "tup1.0 is equal to 1")
        
        let tup2 = (1,2,3)
        
        // XCTAssert(tup1 === tup2, "tup1 === tup2") does not compile
        // XCTAssert(tup1 == tup2, "tup1 == tup2") does not compile
        
        let tup3: (Int, Float) = (1, 3.12)
        XCTAssert(tup3.1 == 3.12, "tup3.1 is equal to 3.12")
        
        let tup4: (Double, String) = (3.12, "a")
        
        XCTAssert(tup4.1 == "a", "tup4.1 is equal to \"a\"")
        
        var tup6: (Double,String) = tup4
        XCTAssert(tup6.1 == "a", "tup6.1 is equal to \"a\"")
        
    }
    
    func testOptionals() {
        let a = "123"
        let b = a.toInt()
        XCTAssert(b == 123, "b should equal 123")
        
        let c = "a"
        var d: Int? = c.toInt()   // toInt is an optional
        
        // d! + 1  ;    runtime error:  Can't unwrap Optional.None
        
        // we can unwrap within an XCTAssert
        XCTAssert(d != 123, "d should not equal 123")
        XCTAssert(d == nil, "d should be nil")
        
        //
        let e: Int? = ("a" as NSString).integerValue
        XCTAssert(e == 0, "f should equal zero")
        var f = e! + 1
        XCTAssert(f != 123, "f should not equal 123")
        XCTAssert(f == 1, "f should 1")
    }


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
