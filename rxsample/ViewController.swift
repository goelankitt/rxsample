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

    var currencyArray: [Cryptocurrency] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchPrices()
    }

    func fetchPrices() {
        API.getCurrencyList(completionHandler: { response in
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string

                let decoder = JSONDecoder()
                if let decoded = try? decoder.decode([Cryptocurrency].self, from: data) {
                    self.currencyArray = decoded
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }

        })
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VCTableViewCell") as! VCTableViewCell
        cell.nameLbl.text = currencyArray[indexPath.row].name
        cell.priceLbl.text = currencyArray[indexPath.row].price_usd
        return cell
    }
}
