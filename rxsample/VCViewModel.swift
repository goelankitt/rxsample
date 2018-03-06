//
//  VCViewModel.swift
//  rxsample
//
//  Created by Ankit Goel on 2/28/18.
//  Copyright © 2018 Ankit Goel. All rights reserved.
//

import Foundation
import RxSwift

class VCViewModel {

    var currencies = Variable<[Cryptocurrency]>([])
    var currenciesObservable: Observable<[Cryptocurrency]>!
    fileprivate let disposeBag = DisposeBag()

    init() {
        setup()
    }

    func setup() {
        currenciesObservable = currencies.asObservable()
            .map { currency in
                return currency
        }
    }

    func fetchCurrencies() {
        API.getCurrencyList(completionHandler: { response in
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                let decoder = JSONDecoder()
                if let decoded = try? decoder.decode([Cryptocurrency].self, from: data) {
                    // Get currencies list using codable
                    self.currencies.value = decoded
                }
            }

        })
    }
}
