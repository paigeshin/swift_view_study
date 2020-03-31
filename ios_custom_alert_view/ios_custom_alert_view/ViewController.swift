//
//  ViewController.swift
//  ios_custom_alert_view
//
//  Created by shin seunghyun on 2020/03/31.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func successButtonPressed(_ sender: UIButton) {
        AlertView.instance.showAlert(title: "Success!", message: "Go To Next Scene!", alertType: .success)
    }
    
    
    @IBAction func failureButtonPressed(_ sender: UIButton) {
    }
    
}

