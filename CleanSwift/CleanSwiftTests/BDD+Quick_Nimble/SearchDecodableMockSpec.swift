//
//  SearchDecodableMockSpec.swift
//  CleanSwiftTests
//
//  Created by Mustafa on 12/19/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import Quick
import Nimble
@testable import CleanSwift

class SearchDecodableMockSpec: QuickSpec {
    var sut: SearchResponsableMock!

    override func spec() {
        describe("Test the decodable code by decode a mock sample data") {
            beforeEach {
                self.sut = SearchResponsableMock()
            }
            context("When the user search for Adele tracks") {
                it("Should have a 50 tracks") {
                    guard let data = SearchConstants.sampleData.data(using: .utf8) else {
                        return
                    }
                    self.sut.map(data) { result in
                        switch(result) {
                        case .success(let response):
                            expect(response.resultCount).to(equal(50))
                        case .failure(let error):
                            fail(error.localizedDescription)
                        }
                    }
                }
                it("Should the artist name for all tracks is adele") {
                    guard let data = SearchConstants.sampleData.data(using: .utf8) else {
                        return
                    }
                    self.sut.map(data) { result in
                        switch(result) {
                        case .success(let response):
                            expect(response.results?[0].artistName).to(equal("Adele"))
                        case .failure(let error):
                            fail(error.localizedDescription)
                        }
                    }
                }
            }
        }
    }
}
