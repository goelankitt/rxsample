//
//  ViewController.swift
//  rxsample
//
//  Created by Ankit Goel on 2/28/18.
//  Copyright © 2018 Ankit Goel. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let viewModel = VCViewModel()
    fileprivate let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.currenciesObservable
            .subscribe(onNext: { [weak self] currencies in
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)

        viewModel.fetchCurrencies()
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.currencies.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VCTableViewCell") as! VCTableViewCell
        cell.nameLbl.text = viewModel.currencies.value[indexPath.row].name
        cell.priceLbl.text = viewModel.currencies.value[indexPath.row].price_usd
        return cell
    }
}
