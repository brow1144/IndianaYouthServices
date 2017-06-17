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
    
    /*
     * Function to set up login fields
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 4
        
        usernameField.attributedPlaceholder = NSAttributedString(string: usernameField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        passwordField.attributedPlaceholder = NSAttributedString(string: passwordField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        
        
        self.usernameField.delegate = self
        self.passwordField.delegate = self
    }
    
    /*
     * Methood to make all top info hidden
     */
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    /*
     * Return button hides keyboard
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    /*
     * When typing remove username
     */
    @IBAction func removeUsernameText(_ sender: Any) {
        if (usernameField.text == "Email") {
            usernameField.text = ""
        }
    }
    
    /*
     * When typing remove password
     */
    @IBAction func removePasswordText(_ sender: Any) {
        if (passwordField.text == "Password") {
            passwordField.text = ""
        }
    }
    
    /*
     * Don't segue to next view immediatly
     */
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false
    }
    
    /*
     * Take care of logging in to firebase and switch views
     */
    @IBAction func logInPushed(_ sender: UIButton, forEvent event: UIEvent) {        
        if (usernameField.text != "" && passwordField.text != "") {
            Auth.auth().signIn(withEmail: usernameField.text!, password: passwordField.text!, completion: { (user, error) in
                if (user != nil) {
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
}
























