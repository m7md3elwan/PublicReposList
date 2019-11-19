//
//  CategoriesView.swift
//  MimiTask
//
//  Created by Elwan on YEAR.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation
import UIKit

class CategoriesViewController: UIViewController {
    
    // MARK:- Constants
    struct Constants {
        static let cellNibName = "CategoryTableViewCell"
        static let cellIdentifier = "CategoryTableViewCell"
    }
    
    // MARK:- Properties
    private var presenter: CategoriesPresenting!

    // MARK: Outlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Bind
    func configure(presenter: CategoriesPresenting) {
        self.presenter = presenter
    }
    
    // MARK:- UIViewController
    override func viewDidLoad() {
        registerTableViewCell()
        presenter?.viewLoaded()
    }
    
    // MARK:- Methods
    // MARK: Public Methods
    // MARK: Private Methods
    private func registerTableViewCell() {
        let categoryCellNib = UINib(nibName: Constants.cellNibName, bundle: nil)
        tableView.register(categoryCellNib, forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    // MARK: Actions
}

// MARK:- CategoriesViewProtocol
extension CategoriesViewController: CategoriesViewing {
    func reloadData() {
        tableView.reloadData()
    }
}

// MARK:- UITableViewDataSource, UITableViewDelegate
extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let categoryCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? CategoryTableViewCell else {
            return UITableViewCell()
        }
        
        categoryCell.configure(viewModel: presenter?.viewModelForItem(index: indexPath.row) ?? "")
        
        return categoryCell
    }
}
