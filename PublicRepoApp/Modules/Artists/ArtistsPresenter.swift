//
//  CategoriesPresenter.swift
//  MimiTask
//
//  Created by Elwan on YEAR.
//  Copyright © 2019 Elwan. All rights reserved.
//


import Foundation

class CategoriesPresenter {
    
    // MARK:- Properties
    weak var view: CategoriesViewing?
    private let interactor: CategoriesInteracting
    private let router: CategoriesRouting

    init(interactor: CategoriesInteracting, router: CategoriesRouting) {
        self.interactor = interactor
        self.router = router
    }
}

// MARK:- CategoriesPresenterProtocol
extension CategoriesPresenter: CategoriesPresenting {
    
    func numberOfItems() -> Int {
        return interactor.data.count
    }
    
    func viewModelForItem(index: Int) -> String {
        return interactor.data[index]
    }
    
    func viewLoaded() {
        interactor.loadIntialData()
    }
}

// MARK:- CategoriesInteractorDelegate
extension CategoriesPresenter: CategoriesInteractorDelegate {
    func dataUpdated() {
        view?.reloadData()
    }
}
