//
//  ViewController.swift
//  IndianaYouthServices
//
//  Created by Kyle Brown on 6/16/17.
//  Copyright © 2017 Kyle Brown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var backgroundImage: UIImageView!
    
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var usernameField: UITextField!
    
    @IBOutlet var createAccountButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 4
        loginButton.backgroundColor = UIColor.orange
        loginButton.setTitleColor(UIColor.white, for: .normal)
        
        //test 2
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

