//
//  SearchInteractorStubTests.swift
//  CleanSwiftTests
//
//  Created by Mustafa on 12/19/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import XCTest
@testable import CleanSwift

class SearchInteractorStubTests: XCTestCase {
    var sut: SearchInteractorStub!

    override func setUp() {
        super.setUp()
        sut = SearchInteractorStub()
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func testSearchDecodableStub_Closure_ResultCount() {
        sut.search(keywords: "song") { response in
             XCTAssertEqual(response.resultCount, 50)
        }
    }
    func testSearchDecodableStub_Delegate_ResultCount() {
        sut.search(keywords: "song")
        XCTAssertEqual(sut.searchResponse.resultCount, 50)
    }
}
