//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Walker Vonder Haar on 5/25/19.
//  Copyright © 2019 Walker Vonder Haar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    // Code below executes when the app's view first loads
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showMessagePressed(_ sender: UIButton) {
        messageLabel.text = "You Are Awesome!"
    }
}

