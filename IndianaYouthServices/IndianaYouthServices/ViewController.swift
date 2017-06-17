//
//  ViewController.swift
//  IndianaYouthServices
//
//  Created by Kyle Brown on 6/16/17.
//  Copyright © 2017 Kyle Brown. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var errorLabel: UILabel!
    
    @IBOutlet var mainLabel: UILabel!
    
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 4
        
        mainLabel.font = UIFont(name: "Avenir-Light", size: 70)
        
        
        usernameField.attributedPlaceholder = NSAttributedString(string: usernameField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        
        passwordField.attributedPlaceholder = NSAttributedString(string: passwordField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        
        self.usernameField.delegate = self
        self.passwordField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func removeUsernameText(_ sender: Any) {
        usernameField.text = ""
    }
    
    @IBAction func removePasswordText(_ sender: Any) {
        passwordField.text = ""
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false
    }
    
    @IBAction func logInPushed(_ sender: UIButton, forEvent event: UIEvent) {        
        if (usernameField.text != "" && passwordField.text != "") {
            Auth.auth().signIn(withEmail: usernameField.text!, password: passwordField.text!, completion: { (user, error) in
                if (user != nil) {
                    print("SIGNED INNNNNNNN")
                    self.performSegue(withIdentifier: "logInSegway", sender: self)
                } else {
                    if let myError = error?.localizedDescription {
                        print(myError)
                        self.errorLabel.text = myError
                    } else {
                        print("ERROR!")
                        self.errorLabel.text = "We don't recognize that email or password!"
                    }
                }
            })
        }
    }
    
    @IBAction func createAccountPushed(_ sender: UIButton, forEvent event: UIEvent) {
        performSegue(withIdentifier: "createAccountSegway", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
























