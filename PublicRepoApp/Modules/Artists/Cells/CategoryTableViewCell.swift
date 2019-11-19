//
//  CategoryTableViewCell.swift
//  PublicRepoApp
//
//  Created by Elwan on 11/19/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet var categoryNameTitleLabel: UILabel!
    
    func configure(viewModel: String) {
        categoryNameTitleLabel.text = viewModel
    }
    
}
