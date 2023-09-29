//
//  LibraryViewControllerTests.swift
//  FilmFestTests
//
//  Created by Alice’z Poy on 2023-09-29.
//  Copyright © 2023 Author. All rights reserved.
//

import XCTest

@testable import FilmFest
final class LibraryViewControllerTests: XCTestCase {

    var sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        _ = sut.view // <- We triggered the VC to init.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Nil checks
    func testLibraryVC_TableViewShouldNotBeNil() {
        XCTAssertNotNil(sut.libraryTableView)
    }

    
    // MARK: Data Source
    func testDataSource_ViewDidLoad_SetsTableViewDataSrouce() {
        XCTAssertNotNil(sut.libraryTableView.dataSource)
        XCTAssertTrue(
            sut.libraryTableView.dataSource is
            MovieLibraryDataService)
    }
    
    // MARK: Delegate
    func testDelegate_ViewDidLoad_SetsTableViewDelegate() {
        XCTAssertNotNil(sut.libraryTableView.delegate)
        XCTAssertTrue(
            sut.libraryTableView.delegate is
            MovieLibraryDataService)
    }
    
    // MARK: Data Service Assumptions
    func testDataService_ViewDidLoad_SingleDataServiceObject() {
        XCTAssertEqual(sut.libraryTableView.dataSource as! MovieLibraryDataService,
                       sut.libraryTableView.delegate as! MovieLibraryDataService)
    }
    
}
