//
//  HomeViewController.swift
//  Fetch Rewards Take Home Project
//
//  Created by Valerie Don on 9/8/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        viewModel.fetchData() { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()

            }
        }
    }
}

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.applicants.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        let name = viewModel.applicants[indexPath.row].name ?? ""
        let listId = viewModel.applicants[indexPath.row].listId
        cell.textLabel?.text = "\(listId): " + name
        return cell
    }
}
