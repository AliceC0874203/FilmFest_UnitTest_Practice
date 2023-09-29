//
//  MovieManagerTests.swift
//  FilmFestTests
//
//  Created by Alice’z Poy on 2023-09-29.
//  Copyright © 2023 Author. All rights reserved.
//

import XCTest

@testable import FilmFest
final class MovieManagerTests: XCTestCase {
    
    var sut = MovieManager()
    
    let scifiMovie = Movie(title: "Sci-Fi")
    let artMovie = Movie(title: "Art")
    let dramaMovie = Movie(title: "Drama")
    
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }

    // MARK: Init Value
    func testInit_MoviesToSee_ReturnsZero() {
        //sut = System Under Test
//        let sut = MovieManager()
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnsZero() {
        //sut = System Under Test
//        let sut = MovieManager()
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }

    // MARK: Add & Query
    func testAdd_MoviesToSee_ReturnsOne() {
//        let testMovie = Movie(title: "Sci-Fi")
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnMovieAtIndex() {
        //We added movie
//        let testMovie = Movie(title: "Art Drama")
        sut.addMovie(movie: dramaMovie)
        
        //We try to query
        let movieQueried = sut.movieAtIndex(index: 0)
        
        //We check if it correct value we get
        XCTAssertEqual(dramaMovie.title, movieQueried.title)
    }
    
    //MARK: Checking Off
    func testCheckOffMovie_UpdatesMovieManagerCounts() {
        //Added simulator movie
        sut.addMovie(movie: artMovie)
        
        //Check it off
        sut.checkOffMovieAtIndex(index: 0)
        
        //Check result
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemovesMovieFromArray() {
        // We added 2
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: artMovie)
        
        // We remove sci-fi
        sut.checkOffMovieAtIndex(index: 0)
        
        // We should get art for index 0
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, artMovie.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        // Added
        sut.addMovie(movie: scifiMovie)
        
        // Check off
        sut.checkOffMovieAtIndex(index: 0)
        
        // Get the checked off
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
        
        // Check result
        XCTAssertEqual(scifiMovie.title, movieQueried.title)
    }
    
    // MARK: Clearing & Reseting
    func testClearArrays_ReturnsArrayCountsOfZero() {
        // Added 2
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: dramaMovie)
        
        // Seen 1
        sut.checkOffMovieAtIndex(index: 0)
        
        // Seen should be 1, unseen should be 1
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        // Clear
        sut.clearArrays()
        
        // All should be 0
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: Duplicates
    func testDuplicatesMovies_ShouldNotBeAddedToArray() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
}
