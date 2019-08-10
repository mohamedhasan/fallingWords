//
//  LanguageHandlerTests.swift
//  FallingWordsTests
//
//  Created by Hasan on 8/10/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import XCTest

class LanguageHandlerTests: XCTestCase {

    override func setUp() {
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadWords() {
        LanguageHandler.sharedInstance.loadWords(success: {
            XCTAssertGreaterThan(LanguageHandler.sharedInstance.wordsList.count, 0)
        }) { (error) in}
    }
    
    func testRandomWordsCollection() {
        LanguageHandler.sharedInstance.loadWords(success: {
            let testList = LanguageHandler.sharedInstance.randomWordsCollection(size: 1)
            XCTAssertGreaterThan(testList.count, 0)
        }) { (error) in}
    }
    
    func testRandomArray() {
        
        let list = Array(1...100)
        let randomList = list[randomPick:100]
        
        var counter = 1
        while counter == randomList[counter] {
            counter += 1
        }
        
        XCTAssertNotEqual(list.count, counter)
    }
    

}
