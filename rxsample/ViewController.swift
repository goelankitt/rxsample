//
//  ViewController.swift
//  rxsample
//
//  Created by Ankit Goel on 2/28/18.
//  Copyright © 2018 Ankit Goel. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let viewModel = VCViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.onCurrenciesFetched = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        viewModel.fetchCurrencies()
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.currencies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VCTableViewCell") as! VCTableViewCell
        cell.nameLbl.text = viewModel.currencies[indexPath.row].name
        cell.priceLbl.text = viewModel.currencies[indexPath.row].price_usd
        return cell
    }
}
