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
    @IBOutlet var mainTitle: UILabel!
    @IBOutlet var label: UILabel!
    
    @IBOutlet var personIcon: UILabel!
    @IBOutlet var lockIcon: UILabel!
    
    @IBOutlet var passwordLabel: UILabel!

    /*
     * On load make sure username is on top of screen
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let userID = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()
        ref.child(userID!).observeSingleEvent(of: .value, with: {(snapshot) in
            let Dict = snapshot.value as! NSDictionary
            self.mainTitle.text = Dict.value(forKey: "name")! as? String
        })

    }
    
    /*
     * Housing button transfers to website
     */
    @IBAction func googleHousing(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "https://affordablehousingonline.com/housing-search/Indiana")! as URL)
    }
    
    /*
     * Education button transfers to website
     */
    @IBAction func googleEducation(_ sender: Any) {
    UIApplication.shared.openURL(NSURL(string: "http://www.doe.in.gov/")! as URL)
    }
    
    /*
     * Finance button transfers to webstie
     */
    @IBAction func googleFinance(_ sender: Any) {
    UIApplication.shared.openURL(NSURL(string: "https://financialaidtoolkit.ed.gov/tk/learn.jsp")! as URL)
    }
    
    /*
     * Set Font Awesome Fonts
     */
    override func viewDidAppear(_ animated: Bool) {
        var faicon = [String: unichar]()
        faicon["famusers"] = 0xf007
        self.personIcon.font = UIFont(name: "FontAwesome", size: 20)!
        self.personIcon.text = String(format: "%C", faicon["famusers"]!)
        
        faicon = [String: unichar]()
        faicon["falock"] = 0xf023
        self.lockIcon.font = UIFont(name: "FontAwesome", size: 20)!
        self.lockIcon.text = String(format: "%C", faicon["falock"]!)
    
    }
    
    /*
     * Log user out and switch views
     */
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



















