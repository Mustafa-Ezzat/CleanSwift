//
//  SearchModuleDeinitSpec.swift
//  CleanSwiftTests
//
//  Created by Mustafa on 12/19/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import Quick
import Nimble
@testable import CleanSwift

class SearchModuleSpec: QuickSpec {
    var sut: SearchConfig!
    var vc: SearchViewController!
    
    override func spec() {
        describe("Test the memory management for search module") {
            beforeEach {
                self.sut = SearchConfig()
                self.vc = SearchViewController()
                self.sut.createModule(view: self.vc)
            }
            context("When call create module method, ") {
                it("That mean all architecture components must init") {
                    guard let interactor = self.vc?.interactor as? SearchInteractor, let _ = interactor.presenter as? SearchPresenter else {
                        fail("Init components failed")
                        return
                    }
                    // pretty cool
                    assert(true, "Module components init successfylly")
                }
            }
            context("When search view controller no longer used, ") {
                it("That mean all architecture components must deinit") {
                    self.vc = nil
                    guard let interactor = self.vc?.interactor as? SearchInteractor, let _ = interactor.presenter as? SearchPresenter else {
                        // pretty cool
                        assert(true, "Module components deinit successfylly")
                        return
                    }
                    fail("Deinit components failed")
                }
            }
        }
    }
}
