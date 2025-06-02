//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let app = FirebaseApp.app() {
                print("✅ Firebase is initialized: \(app.name)")
            } else {
                print("❌ Firebase is NOT initialized")
        }
       
    }

}
