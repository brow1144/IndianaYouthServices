//
//  createAccountViewController.swift
//  IndianaYouthServices
//
//  Created by Kyle Brown on 6/16/17.
//  Copyright © 2017 Kyle Brown. All rights reserved.
//

import UIKit
import FirebaseAuth

class createAccountViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var emailField: UITextField!
    
    @IBOutlet var createButton: UIButton!
    
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }
    
    @IBAction func removeNameText(_ sender: Any) {
        nameField.text = ""
    }
    
    @IBAction func removePasswordText(_ sender: Any) {
        passwordField.text = ""
    }
    
    @IBAction func removeEmailText(_ sender: Any) {
        emailField.text = ""
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        performSegue(withIdentifier: "createAccountBackButton", sender: self)
    }
    
    @IBAction func createAccountAction(_ sender: UIButton, forEvent event: UIEvent) {
        
        if (nameField.text != "" && passwordField.text != "" && emailField.text != "") {
            FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
                if (user != nil) {
                    print("CREATEDDDDD UPPPPPP")
                } else {
                    if let myError = error?.localizedDescription {
                        print(myError)
                    } else {
                        print("ERROR!")
                    }
                }
            })
        }
        
    }
}













