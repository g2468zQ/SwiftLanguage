//
//  Basics.swift
//  SwiftLanguage
//
//  Created by Rodney Degracia on 6/6/14.
//  Copyright (c) 2014 Venture Intellectual LLC. All rights reserved.
//


import XCTest

class Basics : XCTestCase  {

    func ary1()->[Int] {
        return [1,2,3]
    }
    
    func ary2()->[Int] {
        return [1,2,3]
    }
    
    func ary12()->[Int] {
        return (ary1() + ary2())
    }
    
    func tuple1()->(Int, Character,String) {
        return (1, "a","Hello")
    }
    
    func tuple2()->(Int, Character, String ) {
        return (1, "a", "Hello")
    }
    
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
        let a1: NSNumber = NSNumber(value: 3 as Int32)
        XCTAssert(a == 3, "a should equal 3")
        XCTAssert(a == a1.intValue, "a should equal 3")

        //XCTAssert(a1 == a, "a1 should equal a")
        
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
        
        let _: Int = 1
        let _ : Int = 2
        let _ :Int = 3
        // XCTAssert(_ == _, "_ should equal _") ; ambigious use of operator ==
        
        let a1: Int = Int(3.12)
        let a2: Float = Float(3.12)
        let a3: Double = Double(3.12)
       
        // The compiler is more stringent, we must convert to larger type, before comparison
        XCTAssert(a3 != Double(a2), "Float(3.12) should not equal Double(3.12)")
        XCTAssert(Double(a1) != a3, "Int(3.12) should not equal Double(3.12)")
        XCTAssert(Float(a1) != a2, "Int(3.12) should not equal Float(3.12)")

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
        print(friendlyWelcome)
    }
    
    func testIntegerBounds() {
        let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
        let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8
        
        XCTAssert(minValue == 0, "minValue should equal 0")
        XCTAssert(maxValue == 255, "maxValue should equal 255")
        
        // Runtime Error Swift 3.1
        // XCTAssert(MemoryLayout<Int32>.size == MemoryLayout<Int>.size, "size of Int32 should equal size of Int ")
        // XCTAssert(MemoryLayout<Int64>.size != MemoryLayout<Int>.size, "size of Int32 should equal size of Int , 32bit platform")
        
        // XCTAssert(MemoryLayout<UInt32>.size == MemoryLayout<UInt>.size, "size of Int32 should equal size of UInt ")
        // XCTAssert(MemoryLayout<UInt64>.size != MemoryLayout<UInt>.size, "size of Int64 should equal size of UInt , 32bit platform")
        
        // XCTAssert(MemoryLayout<Int32>.size == MemoryLayout<Int>.size, "size of Int64 should equal size of Int ")
        // XCTAssert(MemoryLayout<Int64>.size != MemoryLayout<Int>.size, "size of Int6 should equal size of Int , 32bit platform")
        XCTAssert(true, "Pass")
    }
    
    func testFloatingPoint() {
        let f1 = 3.12   // Default as Double
        let f11: NSNumber = NSNumber(value: 3.12 as Double)
        let f2: Double = 3.12
        
        XCTAssert(f1 == f2, "3.12 should equal Double(3.12)")
        XCTAssert(f1 == f11.doubleValue, "3.12 should equal NSNumber(double: 3.12)")
        XCTAssert(f11.doubleValue == f2, "NSNumber(double: 3.12) should equal Double(3.12)")
    }
    
    
    func testtypeSafety() {
        
        let f1 = 3.12   // Default as Double
        let f11: NSNumber = NSNumber(value: 3.12 as Double)
        let f2: Double = 3.12
        
        // implicitly can be cast to Double or NSNumber
        let _ = f1 as Double
        let _ = f1 as NSNumber
        
        // NSNumber can only be cast into NSNumber or Double if using as! to force
        let _ = f11 as NSNumber
        let _ = f11 as! Double
        
        // Double can be cast into Double or NSNumber
        let _ = f2 as Double
        let _ = f2 as NSNumber
        
        let f1string = (f1 as NSNumber).stringValue
        XCTAssert(f1string == "3.12", "(f1 as NSNumber).stringValue should equal \"3.12\"")
    }
    
    
    func testNumericLiterals() {
        // Numeric Literals
        
        let _ = 17
        let binaryInteger = 0b10001       // 17 in binary notation
        let octalInteger = 0o21           // 17 in octal notation
        let hexadecimalInteger = 0x11     // 17 in hexadecimal notation
        
        // Can cast to NSNumber, but not Double
        let _ = binaryInteger as NSNumber
        let _ = octalInteger as NSNumber
        let _ = hexadecimalInteger as NSNumber
        
        let i_binaryInteger = (binaryInteger as NSNumber).intValue
        XCTAssert(i_binaryInteger == 17, "(binaryInteger as NSNumber).integerValue is equal to 17")
        
        let i_octalInteger = (octalInteger as NSNumber).intValue
        XCTAssert(i_octalInteger == 17, "(octalInteger as NSNumber).integerValue is equal to 17")
        
        let i_hexadecimalInteger = (hexadecimalInteger as NSNumber).intValue
        XCTAssert(i_hexadecimalInteger == 17, "(hexadecimalInteger as NSNumber).integerValue is equal to 17")
        
    }
    
    
    func testNumericTypeConversion() {
        XCTAssert(MemoryLayout<UInt8>.size < MemoryLayout<UInt>.size, "sizeof(UInt8) should be less than sizeof(UInt)")
        XCTAssert(MemoryLayout<UInt16>.size < MemoryLayout<UInt>.size, "sizeof(UInt16) should be les than sizeof(UInt)")
        
        // Runtime Error Swift 3.1
        // XCTAssert(MemoryLayout<UInt32>.size == MemoryLayout<UInt>.size, "(sizeof(UInt32) should be equal to sizeof(UInt)")
        // XCTAssert(MemoryLayout<UInt64>.size > MemoryLayout<UInt>.size, "sizeof(UInt64) should be greater than sizeof(UInt)")
        
        let x64 = UInt64(UInt32(UInt16(UInt8(1))))
        XCTAssert( x64 == 1, "UInt64(UInt32(UInt16(UInt8(1)))) should equal 1")
        
        let x8  = UInt8(UInt16(UInt32(UInt64(1))))
        XCTAssert( UInt8(UInt16(UInt32(UInt64(1)))) == x8, "UInt8(UInt16(UInt32(UInt64(1)))) should equal 1")
        
    }
    
    func testIntegerFloatingPointConversion() {
        let xx = 3.0    // default Double
        let yy = xx + 1
        let _ = yy as NSNumber
        let _ = yy as Double
        XCTAssert(Int(xx) + 1 == Int(xx) + 1, "3.0 + 1 should equal Int(3.0) + 1")
    }
    
    func testTypeAlias() {
        typealias YY = UInt16
        let _ = UInt8(YY(1))
        
        typealias ZZ = Double
        let ZZ1 = ZZ(1)
        
        let dd = ZZ1 as Double
        XCTAssert(dd == 1.0 , "dd should equal 1.0")
        XCTAssert( (ZZ1 as Double) == 1.0, "(ZZ1 as Double) should equal 1.0")
        
        let a = ZZ1 as NSNumber
        let b = a.intValue
        XCTAssert(b == 1, "Should be 1")
    }

    func testBooleans() {
        // Booleans
        
        let bool1 = Bool(1)
        
        XCTAssert(bool1 == true, "bool1 should be true")
        
        let _ = bool1 == true
        let _ = !bool1 == !true
        
        let _ = !(!bool1) == !(!true)
        let _ = !(!true) == !(!bool1)
        
        let _ = !(!true) == !(!bool1)
        
        

        let bool2 = Bool("a")
        XCTAssert(bool2 == nil, "bool2 should be nil")
        
        let bool3 = Bool(0)
        XCTAssert(bool3 == false, "bool3 should be false")
        
        let bool4 = Bool(-1)
        XCTAssert(bool4 == true, "bool4 should be true")

    }
    
    func testTuples() {
        
        let tup1 = (1, 2, 3)
        XCTAssert(tup1.0 == 1, "tup1.0 is equal to 1")
        
        let tup2 = (1,2,3)
        
        // XCTAssert(tup1 === tup2, "tup1 === tup2") // does not compile, Binary operator '===' cannot be applied to two '(Int, Int, Int)' operands
        XCTAssert(tup1 == tup2, "tup1 == tup2")  
        
        let tup3: (Int, Float) = (1, 3.12)
        XCTAssert(tup3.1 == 3.12, "tup3.1 is equal to 3.12")
        
        let tup4: (Double, String) = (3.12, "a")
        
        XCTAssert(tup4.1 == "a", "tup4.1 is equal to \"a\"")
        
        let tup6: (Double,String) = tup4
        XCTAssert(tup6.1 == "a", "tup6.1 is equal to \"a\"")
        
    }
    
    func testOptionals() {
        let a = "123"
        let b = Int(a)
        XCTAssert(b == 123, "b should equal 123")
        
        let c = "a"
        let d: Int? = Int(c)   // toInt is an optional
        XCTAssert(d == nil, "d is nil")

        
        // we can unwrap within an XCTAssert
        XCTAssert(d != 123, "d should not equal 123")
        XCTAssert(d == nil, "d should be nil")
        
        //
        let ee: Int? = ("a" as NSString).integerValue
        XCTAssert(ee == 0, "f should equal zero")
        let f = ee! + 1
        XCTAssert(f != 123, "f should not equal 123")
        XCTAssert(f == 1, "f should 1")
        
        let g: String? = nil
        
        if (g != nil) {
            
        }
    }
    
    
    func testNil() {
        var a: Int? = Int(2)
        a = nil
        XCTAssert( a == nil, "a is nil");
        
        var b:Int? = Int(3)
        //a = a! + b!


        XCTAssert( a != 0, "nil is not zero");
        
        XCTAssert( nil == nil, "nil should be nil");
        XCTAssert( (nil == 0) == false, "nil is not zero");
        XCTAssert( (nil == 1) == false, "nil is not one");
        XCTAssert( (nil == -1) == false, "nil is not one");
        XCTAssert( (nil == false) == false, "nil is not false");
        XCTAssert( (nil == true) == false, "nil is not true");


    }
    
    func testAssignment() {
        let a:(Int, Int, Int)

        // variable a.0 must be initialized before first use
        // print(a)
        
        a = (1, 2, 3)
        
        // can not String to type Int
        // a = (1, 2, "a")
        
        // Cannot assign value of type '(Int, (Int, Int, Int))' to type 'Int'
        //a = (1,2, (1, (1,2,3)))
    
        let _: (Int, (Int, (Int)));
        _ = (1, (1, (1)))
        
        let c: Int? = nil
        if let d = c {
            print(d);
        }
    }
    
    func testArithmeticOperators() {
        
        XCTAssert(ary12() == (ary1() + ary2()), "ary12 should equal ary1 + ary2")
        
        let a = [1,2,3] + [4]
        XCTAssert(a == [1,2,3,4], "[1,2,3] + [4]")
        
        // Amibiguous == operator
        // XCTAssert([1,2,3,4] == [1,2,3,4], "[1,2,3] + [4]")
        
        // Could not overload for ===
        //XCTAssert((1,2,"A") == (1,2, "A"), "(1,2,\"A\") should be equal to (1,2,\"A\")")
        
        // Could not find overload for ==
        // var b = [1,2,3] - [3]
        // XCTAssert(b == [1,2], "b should equal [1,2]")
        
        // Could not find overload for *
        //var b1 = [1,2,3] * 3
        
        // Could not find overload for /
        // var b1 = [1,2,3] / 3
        
    }
    
    func testFPRemainder() {
        XCTAssert( 8%3 == 2, "8 divided by 3 is equal to remainder 2");
    }
    
    func testArrays() {
    
        // Cast and use as NSArray
        let shoppingList = ["a", "b", "c"]
        let nsarray = shoppingList as NSArray
        let f = nsarray.count
        XCTAssert(f == 3, "count should be 3")
        
        let a1 = [1]
        let a2 = [2]
        let a3 = a1 + a2
        XCTAssert(a3 == [1, 2], "a3 should be [1, 2]")
        
        let a: NSArray = [1, 2, 3]
        let b = a as Array
        
        // Value of type '[Int]' has no member 'isKindOfClass'
        // XCTAssert([4].isKindOfClass(Array<Int>), "[4] is a generic")
        
        let c = b + ([4] as Array)
        
        //  Binary operator '==' cannot be applied to operands of type '[AnyObject]' and '[Int]'
        // XCTAssert( (c == [1, 2, 3, 4])     , "c should equal [1, 2, 3, 4]")
        

    }
    
    func testIncrementDecrement() {
        var aa: Int = 3
        aa += 1
        aa += 1
        aa -= 1
        aa -= 1
        //++(++aa)

        // “The compound assignment operators do not return a value. However the compiler does return the type as ()
        // ????
        var bb:() = aa += 1
        print(bb)
        // bb.0 += 1
        // bb.0 -= 1
        
    }
    
    
    func testComparison() {
        XCTAssert( 1 == 1, "pass");
        XCTAssert( Bool(1) == true, "pass");
        XCTAssert( Bool(0) == false, "pass");
        

        XCTAssert(Bool(-0) == false, "pass")
        XCTAssert(-0 == 0, "pass")


        
        // What is -1 ?
        XCTAssert(Bool(-1) == true, "pass")

        
        XCTAssert( nil == nil, "pass");
        

        
//        var a: Int = 0
//        XCTAssert( Bool(Int(a+=1)) == true, "pass");
//        XCTAssert( Bool(--a) == false, "pass");

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }

}
