//
//  ViewController.swift
//  IndianaYouthServices
//
//  Created by Kyle Brown on 6/16/17.
//  Copyright © 2017 Kyle Brown. All rights reserved.
//

import UIKit

var username = ""

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var backgroundImage: UIImageView!
    
    @IBOutlet var mainLabel: UILabel!
    
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 4
        loginButton.backgroundColor = UIColor.orange
        loginButton.setTitleColor(UIColor.white, for: .normal)
        
        createAccountButton.setTitleColor(UIColor.white, for: .normal)
        
        mainLabel.font = UIFont(name: "Avenir-Light", size: 70)
        
        self.usernameField.delegate = self
        self.passwordField.delegate = self
    }
    
    @IBAction func logInPushed(_ sender: UIButton, forEvent event: UIEvent) {
        username = usernameField.text!
        performSegue(withIdentifier: "logInSegway", sender: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
























