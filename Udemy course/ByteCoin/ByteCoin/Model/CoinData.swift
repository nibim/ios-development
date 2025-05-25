//
//  CoinData.swift
//  ByteCoin
//
//  Created by Nima Beig Mohammadi on 22.05.25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let time:  String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
