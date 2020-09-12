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
            print("HOMEVC VIEWMODEL APPLICANTS", self?.viewModel.applicants)
        }
    }
}

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.applicants.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(viewModel.applicants[indexPath.row].listId),  \(viewModel.applicants[indexPath.row].name)"
        return cell
    }
}
