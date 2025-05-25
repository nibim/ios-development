//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    var selectedCurrency: String = ""
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    var coinManager = CoinManager()
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCurrency = coinManager.currencyArray[row]
        print(selectedCurrency)
        coinManager.getCoinPrice(for: selectedCurrency)
    }
    
    
    @IBOutlet weak var bitcoinLabel: UILabel!  //lastPriceOfSelectedCurrency
    @IBOutlet weak var currencyLable: UILabel! //the selected currency
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()    //when the view is loaded , ios itself calls pickerViews methods
        // Do any additional setup after loading the view.
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self

    }
    
}
extension ViewController: CoinManagerDelegate {
    func didUpdateCoinPrice(_ coinManager: CoinManager, coinPrice: Double) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = String(format: "%.2f", coinPrice)
            self.currencyLable.text = self.selectedCurrency
        }
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}
