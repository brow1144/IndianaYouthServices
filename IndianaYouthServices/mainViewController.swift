//
//  mainViewController.swift
//  IndianaYouthServices
//
//  Created by Kyle Brown on 6/16/17.
//  Copyright © 2017 Kyle Brown. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

var handle:DatabaseHandle?
var ref:DatabaseReference?

class mainViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    @IBOutlet var passwordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        ref = Database.database().reference()
//        let userID = Auth.auth().currentUser?.uid
//        
//        ref?.child(userID!).child("email").observeSingleEvent(of: .value, with: { (snapshot) in
//            if let item = snapshot.value as? String{
//                self.label.text = item
//            }
//        })
//        
//        ref?.child(userID!).child("password").observeSingleEvent(of: .value, with: { (snapshot) in
//            if let item = snapshot.value as? String{
//                self.passwordLabel.text = item
//            }
//        })
    
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



















