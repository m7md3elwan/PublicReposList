//
//  CategoriesModuleFactory.swift
//  MimiTask
//
//  Created by Elwan on YEAR.
//  Copyright © 2019 Elwan. All rights reserved.
//


import UIKit

class CategoriesModuleFactory {
    
    // MARK:- Constants
    struct Constants {
        static let storyBoardName: String = "Main"
        static let viewIdentifier: String = "CategoriesViewController"
    }
    
    static func makeModule(storyBoard: UIStoryboard = UIStoryboard(name: Constants.storyBoardName, bundle: nil),
                           viewIdentifier: String = Constants.viewIdentifier) -> UIViewController {
        
        let router = CategoriesRouter()
        let service = CategoriesService()
        let interactor = CategoriesInteractor(service: service)
        let presenter = CategoriesPresenter(interactor: interactor, router: router)
        let viewController = storyBoard.instantiateViewController(withIdentifier: Constants.viewIdentifier) as! CategoriesViewController
        
        viewController.configure(presenter: presenter)
        router.viewController = viewController
        presenter.view = viewController
        interactor.delegate = presenter
        
        return viewController
    }
}
