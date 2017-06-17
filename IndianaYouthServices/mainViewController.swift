//
//  mainViewController.swift
//  IndianaYouthServices
//
//  Created by Kyle Brown on 6/16/17.
//  Copyright © 2017 Kyle Brown. All rights reserved.
//

import UIKit

class mainViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        label.text = username
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
