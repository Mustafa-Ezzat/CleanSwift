//
//  SearchInteractorMockSpec.swift
//  CleanSwiftTests
//
//  Created by Mustafa on 12/19/19.
//  Copyright © 2019 Andela. All rights reserved.
//
import Quick
import Nimble
@testable import CleanSwift

class SearchInteractorStubSpec: QuickSpec {
    var sut: SearchInteractorStub!
    override func spec() {
        describe("Test the search api response through Moya stub...") {
            beforeEach {
                self.sut = SearchInteractorStub()
            }
            context("When the user search for Adele tracks") {
                it("Should have a 50 tracks as result count") {
                    self.sut.search(keywords: "Adele") { response in
                        expect(response.resultCount).to(equal(50))
                    }
                }
            }
        }
    }
}
