//
//  VCViewModel.swift
//  rxsample
//
//  Created by Ankit Goel on 2/28/18.
//  Copyright © 2018 Ankit Goel. All rights reserved.
//

import Foundation

class VCViewModel {

    var currencies: [Cryptocurrency] = []
    var onCurrenciesFetched: (() -> Void)?

    func fetchCurrencies() {
        API.getCurrencyList(completionHandler: { response in
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string

                let decoder = JSONDecoder()
                if let decoded = try? decoder.decode([Cryptocurrency].self, from: data) {
                    self.currencies = decoded
                    self.onCurrenciesFetched?()
                }
            }

        })
    }
}
