//
//  CryptoModel.swift
//  rxsample
//
//  Created by Ankit Goel on 2/28/18.
//  Copyright © 2018 Ankit Goel. All rights reserved.
//

import Foundation

struct Cryptocurrency: Codable {
    var id: String
    var name: String
    var symbol: String
    var rank: String
    var price_usd: String
    var price_btc: String
    var percent_change_24h: String
}
