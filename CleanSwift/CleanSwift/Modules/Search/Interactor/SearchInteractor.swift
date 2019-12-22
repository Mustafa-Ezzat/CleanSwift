//
//  SearchInteractor.swift
//  CleanSwift
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import Foundation
import Moya

protocol SearchInteractorProtocol {
    func search(keywords: String)
}

class SearchInteractor {
    var presenter: SearchPresenterProtocol?
    let provider = MoyaProvider<SearchTarget>(callbackQueue: DispatchQueue.global(qos: .utility))
    
    deinit {
          print("\(description) go away")
    }
}

extension SearchInteractor: SearchInteractorProtocol {
    func search(keywords: String) {
        provider.request(.search(keywords: keywords)) { result in
            switch(result) {
            case .success(let response):
                do {
                    print("Response: ", try response.mapString())
                    let decodableResponse = try response.map(SearchResponse.self)
                    self.presenter?.present(response: decodableResponse)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


extension SearchInteractor: CustomStringConvertible {
    var description: String {
        return String(describing: SearchInteractor.self)
    }
}
