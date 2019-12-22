//
//  SearchInteractorStub.swift
//  CleanSwiftTests
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import Foundation
@testable import CleanSwift
import Moya

class SearchInteractorStub {
    var provider = MoyaProvider<SearchTarget>(stubClosure: MoyaProvider.immediatelyStub)
    var searchResponse: SearchResponse!

    func search(keywords: String, success: @escaping (SearchResponse) -> ()) {
        provider.request(.search(keywords: keywords)) { result in
            switch(result) {
            case .success(let response):
                do {
                    let decodable = try response.map(SearchResponse.self)
                    success(decodable)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension SearchInteractorStub: SearchInteractorProtocol {
    func search(keywords: String) {
        provider.request(.search(keywords: keywords)) { result in
                  switch(result) {
                  case .success(let response):
                      do {
                        self.searchResponse = try response.map(SearchResponse.self)
                      } catch {
                          print(error.localizedDescription)
                      }
                  case .failure(let error):
                      print(error.localizedDescription)
                  }
              }
    }
}
