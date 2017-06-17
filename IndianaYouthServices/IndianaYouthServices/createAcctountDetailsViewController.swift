//
//  createAcctountDetailsViewController.swift
//  IndianaYouthServices
//
//  Created by Kyle Brown on 6/17/17.
//  Copyright © 2017 Kyle Brown. All rights reserved.
//

import UIKit
import Firebase

class createAcctountDetailsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var ageField: UITextField!
    @IBOutlet var fosterField: UITextField!
    @IBOutlet var genderField: UITextField!
    @IBOutlet var finishSignButton: UIButton!
    
    var ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finishSignButton.layer.cornerRadius = 4
        
        ageField.attributedPlaceholder = NSAttributedString(string: ageField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        
        fosterField.attributedPlaceholder = NSAttributedString(string: fosterField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        
        genderField.attributedPlaceholder = NSAttributedString(string: genderField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.white])
        
        self.ageField.delegate = self
        self.fosterField.delegate = self
        self.genderField.delegate = self
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
    
    @IBAction func removeAgeText(_ sender: UITextField) {
        if (ageField.text == "Age") {
            ageField.text = ""
        }
    }
    
    @IBAction func removeFosterText(_ sender: UITextField) {
        if (fosterField.text == "Year Enterting Foster Care") {
            fosterField.text = ""
        }
    }
    
    @IBAction func removeGenderText(_ sender: UITextField) {
        if (genderField.text == "Gender") {
            genderField.text = ""
        }
    }
    
    @IBAction func finishSignUp(_ sender: Any, forEvent event: UIEvent) {
        self.performSegue(withIdentifier: "completeSignUp", sender: self)
        
        //self.ref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        
        
        self.ref.child(userID!).child("age").setValue(self.ageField.text)
        self.ref.child(userID!).child("gender").setValue(self.genderField.text)
        self.ref.child(userID!).child("yearEnteringFoster").setValue(self.fosterField.text)
    }
}

















