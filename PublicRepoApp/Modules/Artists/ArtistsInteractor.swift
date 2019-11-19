//
//  CategoriesInteractor.swift
//  MimiTask
//
//  Created by Elwan on YEAR.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation

class CategoriesInteractor {
    
    // MARK:- Properties
    weak var delegate: CategoriesInteractorDelegate?
    private let service: CategoriesServicing
    
    // MARK:- Initializers
    init(service: CategoriesServicing) {
        self.service = service
    }
    
    var data = [String](){
        didSet {
            delegate?.dataUpdated()
        }
    }
    
}

// MARK:- CategoriesInteractorInputProtocol
extension CategoriesInteractor: CategoriesInteracting {
    func loadIntialData() {
        service.getAllCategories { (result) in
            switch result {
            case .success(let newData):
                data = newData
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
        
}
