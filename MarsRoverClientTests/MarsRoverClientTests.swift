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

    //testFetchMarsRover() if the decoding works and the data gets brought in
    func testFetchMarsRover() {
        let mock = MockLoader()
        
    }
    
    
    //testFetchPhotos() if the MarsPhotorReference decodes correctly and bring the data
    func testFetchPhoto() {
        
    }
    //test bad data and data that are not existing
    
    //inside of mock add DispatchQueue.main.asysn to give a delay of the call
}
