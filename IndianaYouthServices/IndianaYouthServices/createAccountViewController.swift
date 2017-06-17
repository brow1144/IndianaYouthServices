//
//  createAccountViewController.swift
//  IndianaYouthServices
//
//  Created by Kyle Brown on 6/16/17.
//  Copyright © 2017 Kyle Brown. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class createAccountViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var emailField: UITextField!
    
    @IBOutlet var errorText: UILabel!
    
    @IBOutlet var createButton: UIButton!
    
    var ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        createButton.layer.borderWidth = 0
        
        //nameField.backgroundColor = UIColor(red: 4/255, green: 13/255, blue: 19/255, alpha: 1.0)
        nameField.attributedPlaceholder = NSAttributedString(string: nameField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        
        passwordField.attributedPlaceholder = NSAttributedString(string: passwordField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        
        emailField.attributedPlaceholder = NSAttributedString(string: emailField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])

        createButton.layer.cornerRadius = 10

        self.nameField.delegate = self
        self.passwordField.delegate = self
        self.emailField.delegate = self
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
    
    override func viewDidAppear(_ animated: Bool) {

    }
    
    @IBAction func removeNameText(_ sender: Any) {
        if (nameField.text == "Name") {
            nameField.text = ""
        }
    }
    
    @IBAction func removeEmailText(_ sender: Any) {
        if (passwordField.text == "Password") {
            emailField.text = ""
        }
    }
    
    @IBAction func removePasswordText(_ sender: Any) {
        if (emailField.text == "Email") {
            passwordField.text = ""
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        performSegue(withIdentifier: "createAccountBackButton", sender: self)
    }
        
    @IBAction func createAccountAction(_ sender: UIButton, forEvent event: UIEvent) {
        
        if (nameField.text != "" && passwordField.text != "" && emailField.text != "") {
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
                if (user != nil) {
                    print("CREATEDDDDD UPPPPPP")
                    self.ref = Database.database().reference()
                    
                    //let x = self.nameField.text!
                    let userID = Auth.auth().currentUser?.uid

                
                    self.ref.child(userID!).child("email").setValue(self.emailField.text)
                    self.ref.child(userID!).child("password").setValue(self.passwordField.text)
                    self.performSegue(withIdentifier: "createAccountSucessSegue", sender: self)
                } else {
                    if let myError = error?.localizedDescription {
                        print(myError)
                        self.errorText.text = myError
                    } else {
                        print("ERROR!")
                        self.errorText.text = "Create Account Error!"
                    }
                }
            })
        } else {
            self.errorText.text = "Please Fill in All Fields!"
        }
        
    }
}













