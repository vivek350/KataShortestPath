//
//  kataShortestPathLengthTests.swift
//  kataShortestPathLengthTests
//
//  Created by Vivek Vardhan on 2/21/17.
//  Copyright © 2017 Vivek Vardhan. All rights reserved.
//

import XCTest
@testable import kataShortestPathLength

class kataShortestPathLengthTests: XCTestCase {

    var shortestPath = ShortestPath()
    var testMatrix = Matrix()
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func testShortestPathWithFiveRowsSixColumnsMatrix() {
        let inputArray = [[3,4,1,2,8,6],[6,1,8,2,7,4],[5,9,3,9,9,5],[8,4,1,3,2,6],[3,7,2,1,2,3]]
        let (outputResult,outputLength,outputTestPath) = ("YES", 11, "1 2 1 5 4 5")
        let testCalculatePathLength =  shortestPath.shortestPath(a: inputArray)
        XCTAssertEqual(outputResult, testCalculatePathLength.result, "outputResult is wrong")
        XCTAssertEqual(outputLength, testCalculatePathLength.len, "outputLength is not wrong")
        XCTAssertEqual(outputTestPath, testCalculatePathLength.path, "outputPath is not wrong")
    }
    
    func testShortestPathWithFiveRowsSixColumnsMatrix1() {
        let inputArray = [[3,4,1,2,8,6],[6,1,8,2,7,4],[5,9,3,9,9,5],[8,4,1,3,2,6],[3,7,2,8,6,4]]
        let (outputResult,outputLength,outputTestPath) = ("YES", 16, "1 2 3 4 4 5")
        let testCalculatePathLength =  shortestPath.shortestPath(a: inputArray)
        XCTAssertEqual(outputResult, testCalculatePathLength.result, "outputResult is wrong")
        XCTAssertEqual(outputLength, testCalculatePathLength.len, "outputLength is not wrong")
        XCTAssertEqual(outputTestPath, testCalculatePathLength.path, "outputPath is not wrong")
    }
    
    func testShortestPathWithFiveRowsThreeColumnsMatrix() {
        let inputArray = [[19,10,19,10,19],[21,23,20,19,12],[20,12,20,11,10]]
        let (outputResult,outputLength,outputTestPath) = ("NO", 48, "1 1 1")
        let testCalculatePathLength =  shortestPath.shortestPath(a: inputArray)
        XCTAssertEqual(outputResult, testCalculatePathLength.result, "outputResult is wrong")
        XCTAssertEqual(outputLength, testCalculatePathLength.len, "outputLength is not wrong")
        XCTAssertEqual(outputTestPath, testCalculatePathLength.path, "outputPath is not wrong")
    }
    
    func testShortestPathWithOneRowsFiveColumnsMatrix() {
        let inputArray = [[5,8,5,3,5]]
        let (outputResult,outputLength,outputTestPath) = ("YES", 26, "1 1 1 1 1")
        let testCalculatePathLength =  shortestPath.shortestPath(a: inputArray)
        XCTAssertEqual(outputResult, testCalculatePathLength.result, "outputResult is wrong")
        XCTAssertEqual(outputLength, testCalculatePathLength.len, "outputLength is not wrong")
        XCTAssertEqual(outputTestPath, testCalculatePathLength.path, "outputPath is not wrong")
    }
    
    func testShortestPathWithFiveRowsOneColumnsMatrix() {
        let inputArray = [[5],[8],[5],[3],[5]]
        let (outputResult,outputLength,outputTestPath) = ("YES", 3, "4")
        let testCalculatePathLength =  shortestPath.shortestPath(a: inputArray)
        XCTAssertEqual(outputResult, testCalculatePathLength.result, "outputResult is wrong")
        XCTAssertEqual(outputLength, testCalculatePathLength.len, "outputLength is not wrong")
        XCTAssertEqual(outputTestPath, testCalculatePathLength.path, "outputPath is not wrong")
    }
    
    func testShortestPathWithRowIntegersGreaterThanFifty() {
        let inputArray = [[69,10,19,10,19],[51,23,20,19,12],[60,12,20,11,10]]
        let (outputResult,outputLength,outputTestPath) = ("NO", 0, "")
        let testCalculatePathLength =  shortestPath.shortestPath(a: inputArray)
        XCTAssertEqual(outputResult, testCalculatePathLength.result, "outputResult is wrong")
        XCTAssertEqual(outputLength, testCalculatePathLength.len, "outputLength is not wrong")
        XCTAssertEqual(outputTestPath, testCalculatePathLength.path, "outputPath is not wrong")
    }
    
    func testShortestPathWithOneIntegerGreaterThanFifty() {
        let inputArray = [[60,3,3,6],[6,3,7,9],[5,6,8,3]]
        let (outputResult,outputLength,outputTestPath) = ("YES", 14, "3 2 1 3")
        let testCalculatePathLength =  shortestPath.shortestPath(a: inputArray)
        XCTAssertEqual(outputResult, testCalculatePathLength.result, "outputResult is wrong")
        XCTAssertEqual(outputLength, testCalculatePathLength.len, "outputLength is not wrong")
        XCTAssertEqual(outputTestPath, testCalculatePathLength.path, "outputPath is not wrong")
    }
    
    func testShortestPathWithNegativeIntegerValues() {
        let inputArray = [[6,3,-5,9],[-5,2,4,10],[3,-2,6,10],[6,-1,-2,10]]
        let (outputResult,outputLength,outputTestPath) = ("YES", 0, "2 3 4 1")
        let testCalculatePathLength =  shortestPath.shortestPath(a: inputArray)
        XCTAssertEqual(outputResult, testCalculatePathLength.result, "outputResult is wrong")
        XCTAssertEqual(outputLength, testCalculatePathLength.len, "outputLength is not wrong")
        XCTAssertEqual(outputTestPath, testCalculatePathLength.path, "outputPath is not wrong")
    }
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
