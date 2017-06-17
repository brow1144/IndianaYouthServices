//
//  PersonalPageViewController.swift
//  IndianaYouthServices
//
//  Created by Kyle Brown on 6/17/17.
//  Copyright © 2017 Kyle Brown. All rights reserved.
//

import UIKit

class PersonalPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
