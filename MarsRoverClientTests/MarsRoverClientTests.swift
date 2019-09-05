//
//  MarsRoverClientTests.swift
//  MarsRoverClientTests
//
//  Created by Dongwoo Pae on 9/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy


class MarsRoverClientTests: XCTestCase {
    
    /*
     Does decoding work?
     Deos it bring the data?
     Is the completion handler called if the data is bad?
     Is the completion handler called if the data does not exist?
     Is the next sol 2 bringing what it is supposed to bring?
     
     
     
     Does decoding fail when given bad data?
     Does it build the correct URL?
     Does it build the correct URL Request?
     Are the results saved properly?
     Is the completion handler called if the networking fails?
     */

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
