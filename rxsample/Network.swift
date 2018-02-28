//
//  Network.swift
//  rxsample
//
//  Created by Ankit Goel on 2/27/18.
//  Copyright © 2018 Ankit Goel. All rights reserved.
//

import Foundation
import Alamofire

struct API {

    static func getCurrencyList(completionHandler: @escaping (DefaultDataResponse) -> ()) {
        Alamofire.request("https://api.coinmarketcap.com/v1/ticker/?limit=10").response { response in
            completionHandler(response)
        }
    }

    static func getCurrency(completionHandler: @escaping (DefaultDataResponse) -> ()) {
        Alamofire.request("https://api.coinmarketcap.com/v1/ticker/bitcoin/").response { response in
            completionHandler(response)
        }
    }
}
