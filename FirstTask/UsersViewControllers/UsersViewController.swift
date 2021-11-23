//
//  ViewController.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 18/10/2021.
//

import UIKit

// MARK: - Users View Controller
class UsersViewController: UIViewController {
    
    /// Table View
    @IBOutlet weak var tableView: UITableView!
    
    /// View Model
    private(set) var viewModel: UsersViewModel!
    
    
    /**
     View did Load
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = UsersViewModel()
        setupTableView()
        navigationController?.navigationBar.barStyle = .black
    }
    
    /**
     Setup Table View
    */
    private func setupTableView() {
        UserTableViewCell.registerTableCellView(tableView: self.tableView)
        LoadingTableViewCell.registerLaodingTableCellView(tableView: self.tableView)
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.tintColor = #colorLiteral(red: 0.2916044295, green: 0.5656878948, blue: 0.8853569627, alpha: 1)
        tableView.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    /**
     Fetch User Data
    */
     func fetchUserData(refreshData: Bool = true, offset: Int = 0) {
        if !self.viewModel.getLoadingStatus() {
            self.viewModel.updateLoadingStatus(true)
            API.shared.fetchData(from: offset) { [weak self] users, hits in
                guard let self = self, let newUsers = users, let hits = hits else {
                    self?.viewModel.updateLoadingStatus(false)
                    return
                }
                self.viewModel.updateHits(hits)
                self.viewModel.updateUsers(newUsers, offset)
                self.viewModel.updateLoadingStatus(false)
                self.tableView.reloadData()
            }
        }
    }
    
    /**
     Refresh  Data
    */
    @objc func refreshData(_ sender: UIRefreshControl) {
        API.shared.fetchData(from: 0) { [weak self] users, hits in
            guard let self = self, let newUsers = users, let hits = hits else {
                self?.viewModel.updateLoadingStatus(false)
                return
            }
            self.viewModel.resetUsers()
            self.viewModel.updateHits(hits)
            self.viewModel.updateUsers(newUsers, 0)
            self.viewModel.updateLoadingStatus(false)
            self.tableView.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }
}

