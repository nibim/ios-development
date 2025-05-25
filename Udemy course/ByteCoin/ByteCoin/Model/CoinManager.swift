//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
protocol CoinManagerDelegate: AnyObject {
    func didUpdateCoinPrice(_ coinManager: CoinManager, coinPrice: Double)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apiKey = Secrets.coinAPIKey
    var delegate: CoinManagerDelegate?
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String){
        let urlString = "\(baseURL)\(currency)?apikey=\(apiKey)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
            if let url = URL(string: urlString) {
                
                let session = URLSession(configuration: .default)
                
                let task = session.dataTask(with: url) { (data, response, error) in    /* This sets up a request and attaches a closure that should run when the response comes back.*/
                    if error != nil {
                        self.delegate?.didFailWithError(error: error!)
                    }
                    if let safeData = data {
                        if let coin = self.parseJSON(safeData) {
                            self.delegate?.didUpdateCoinPrice(self,coinPrice: coin)
                        }
                    }
                }
                
                task.resume( )
            }
    }
    func parseJSON(_ coinData: Data)-> Double? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let price = decodedData.rate
            return price
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
}
