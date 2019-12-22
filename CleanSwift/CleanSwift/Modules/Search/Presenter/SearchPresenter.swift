//
//  SearchPresenter.swift
//  CleanSwift
//
//  Created by Mustafa on 12/18/19.
//  Copyright © 2019 Andela. All rights reserved.
//

import Foundation

protocol SearchPresenterProtocol {
    func present(response: SearchResponse)
}

class SearchPresenter: CustomStringConvertible {
    // weak to break the retain cycle
    weak var view: SearchViewProtocol?
    
    var description: String {
        return String(describing: SearchPresenter.self)
    }
    
    deinit {
        print("\(description) go away")
    }
}

extension SearchPresenter: SearchPresenterProtocol {
    func present(response: SearchResponse) {
        guard let list = response.results else {
            return
        }
        let presentationList = list.map {SearchPresentationModel(model: $0)}
        view?.display(list: presentationList)
    }
}
