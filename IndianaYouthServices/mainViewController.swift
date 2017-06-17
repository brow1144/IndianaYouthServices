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
    
    @IBOutlet var personIcon: UILabel!

    @IBOutlet var passwordLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        var faicon = [String: unichar]()
        faicon["famusers"] = 0xf007
        self.personIcon.font = UIFont(name: "FontAwesome", size: 20)!
        self.personIcon.text = String(format: "%C", faicon["famusers"]!)
    
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "logOutSegway", sender: self)
    }
    
    @IBAction func personalPageButton(_ sender: UIButton, forEvent event: UIEvent) {
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func myPageButton(_ sender: Any) {
    
    }
}



















