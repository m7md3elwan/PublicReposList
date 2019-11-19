//
//  CategoriesRouter.swift
//  MimiTask
//
//  Created by Elwan on YEAR.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation

final class CategoriesService: CategoriesServicing {
    func getAllCategories(completion: (Result<[String], Error>) -> Void) {
        completion(.success(["test1", "test2", "test3"]))
    }
}
