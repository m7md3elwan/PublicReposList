//
//  CategoriesProtocols.swift
//  MimiTask
//
//  Created by Elwan on YEAR.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation
import UIKit

// MARK: Presenter -> View
protocol CategoriesViewing: class {
    func reloadData()
}

// MARK: View -> Presenter
protocol CategoriesPresenting: class {
    var view: CategoriesViewing? { get set }

    func numberOfItems() -> Int
    func viewModelForItem(index: Int) -> String
    
    func viewLoaded()
}

// MARK: Presenter -> Interactor
protocol CategoriesInteracting: class {
    var data:[String] { get }
    func loadIntialData()
}


// MARK: Interactor -> Presenter
protocol CategoriesInteractorDelegate: class {
    func dataUpdated()
}


// MARK:- Router Protocols
protocol CategoriesRouting: class {
    var viewController: UIViewController? { get set }
}

// MARK:- Service Protocols
protocol CategoriesServicing {
    func getAllCategories(completion: (Result<[String], Error>) -> Void)
}
