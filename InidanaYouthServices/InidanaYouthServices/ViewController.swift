//
//  ViewController.swift
//  InidanaYouthServices
//
//  Created by Kyle Brown on 6/16/17.
//  Copyright © 2017 Kyle Brown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        self.backgroundImage.image = UIImage(named: "background.jpg");
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.alpha = 0.3
        visualEffectView.frame = view.bounds
        view.addSubview(visualEffectView)
        
        usernameField.layer.cornerRadius = 5
        usernameField.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        usernameField.layer.borderWidth = 0.5
        usernameField.clipsToBounds = true
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

