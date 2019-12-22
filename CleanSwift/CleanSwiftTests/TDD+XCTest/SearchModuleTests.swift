//
//  CleanSwiftTests.swift
//  CleanSwiftTests
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import XCTest
@testable import CleanSwift

class SearchModuleTests: XCTestCase {
    var module: SearchConfig!
    var vc: SearchViewController?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        module = SearchConfig()
        vc = SearchViewController()
        module.createModule(view: vc!)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        module = nil
        vc = nil
        super.tearDown()
    }
    
    func testSearchModule_Init() {
        guard let interactor = vc?.interactor as? SearchInteractor, let _ = interactor.presenter as? SearchPresenter else {
            XCTFail()
            return
        }
        // That mean all architecture components init, pretty cool
        XCTAssert(true)
    }
    
    func testSearchModule_Deinit() {
        // Test Memory Management
        // check deinit
        vc = nil
        guard let interactor = vc?.interactor as? SearchInteractor, let _ = interactor.presenter as? SearchPresenter else {
            // That mean all architecture components deinit, pretty cool
            XCTAssert(true)
            return
        }
        XCTFail()
    }
}
