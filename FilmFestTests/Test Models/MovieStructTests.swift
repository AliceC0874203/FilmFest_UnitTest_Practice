//
//  MovieStructTests.swift
//  FilmFestTests
//
//  Created by Alice’z Poy on 2023-09-29.
//  Copyright © 2023 Author. All rights reserved.
//

import XCTest

@testable import FilmFest
final class MovieStructTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Init
    func testInit_MovieWithTitle() {
        let testMovie = Movie(title: "Generic Blockbuster")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Blockbuster")
    }
    
    func testInit_SetMovieTitleAndReleaseDate() {
        let testMovie = Movie(title: "Romantic Comedy",
                              releaseDate: "1987")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "1987")
    }
    
    // MARK: Equalable
    func testEqualable_ReturnsTrue() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Action")
        
        XCTAssertEqual(actionMovie1, actionMovie2)
    }
    
    func testEqualable_ReturnsNotEqualForDifferentTitles() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Sci-Fi")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    func testEqualable_ReturnsNotEqualForDifferentReleaseDates() {
        let actionMovie1 = Movie(title: "Action", releaseDate: "1999")
        let actionMovie2 = Movie(title: "Action", releaseDate: "2023")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }

}
