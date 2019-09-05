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

    
    var marsRover: MarsRover!
    var marsPhotoReference: [MarsPhotoReference]!
    
    //testFetchMarsRover() if the decoding works and the data gets brought in

    func testFetchMarsRover() {
        
        let mock = MockLoader()
        mock.data = validRoverJSON
        let controller = MarsRoverClient(networkLoader: mock)
        
        let resultsExpectation = expectation(description: "Wait for results")
        
        controller.fetchMarsRover(named: "Curiosity") { (data, error) in
            resultsExpectation.fulfill()
            self.marsRover = data
        }
        wait(for: [resultsExpectation], timeout: 2)
        
        XCTAssertTrue(marsRover.name == "Curiosity", "Expecting Curiosity marsRover being fetched correctly")
        XCTAssertTrue(marsRover.maxSol == 10, "Expecting maxSol to be 10")
        XCTAssertEqual(4156, marsRover.numberOfPhotos)
        
    }
    
    //with badData
    
    func testFetchMarsRoverWithBadData() {
        let mock = MockLoader()
        mock.data = invalidRoverJSON
        let controller = MarsRoverClient(networkLoader: mock)
        
        let resultExpectation = expectation(description: "Wait for results")
        
        controller.fetchMarsRover(named: "Curiosity") { (data, error) in
            resultExpectation.fulfill()
            self.marsRover = data
        }
        
        wait(for: [resultExpectation], timeout: 2)
        
        XCTAssertTrue(marsRover == nil, "Expecting error in decoding")
        XCTAssertNotNil(controller.error)
    }
    
    
    
    //testFetchPhotos() if the MarsPhotorReference decodes correctly and bring the data
    func testFetchPhoto() {
        
        //fetchMarsRover
        let mock = MockLoader()
        mock.data = validRoverJSON
        let controller = MarsRoverClient(networkLoader: mock)
        
        let resultsExpectation = expectation(description: "Wait for results")
        
        controller.fetchMarsRover(named: "Curiosity") { (data, error) in
            resultsExpectation.fulfill()
            self.marsRover = data
        }
        wait(for: [resultsExpectation], timeout: 2)
        
        XCTAssertTrue(marsRover.name == "Curiosity", "Expecting Curiosity marsRover being fetched correctly")
        XCTAssertTrue(marsRover.maxSol == 10, "Expecting maxSol to be 10")
        XCTAssertEqual(4156, marsRover.numberOfPhotos)
        
        
        //getting marsPhoto
        mock.data = validSol1JSON
        
        let resultsExpectations = expectation(description: "Wait for results")
        
        controller.fetchPhotos(from: self.marsRover, onSol: 1) { (data, error) in
            resultsExpectations.fulfill()
            self.marsPhotoReference = data
        }
        
        wait(for: [resultsExpectations], timeout: 2)
        
        XCTAssertEqual(1, marsPhotoReference[0].sol)
        XCTAssertTrue(marsPhotoReference[0].id == 4477, "Expecting marsPhoto")
        XCTAssertEqual("MAST", marsPhotoReference[0].camera.name)
        XCTAssertNil(controller.error)
    }
}
