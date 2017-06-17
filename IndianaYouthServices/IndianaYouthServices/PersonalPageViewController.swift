//
//  PersonalPageViewController.swift
//  IndianaYouthServices
//
//  Created by Kyle Brown on 6/17/17.
//  Copyright © 2017 Kyle Brown. All rights reserved.
//

import UIKit
import Firebase

class PersonalPageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var backgroundToImg: UILabel!
    
    @IBOutlet var driversLicenseLabel: UILabel!
    @IBOutlet var driverLicenseImg: UIImageView!
    @IBOutlet var driversLicenseButton: UIButton!
    
    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        
        
        
    }
    
    
    @IBAction func pickImage(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            } else {
                print("Camera Not Working")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
        self.backgroundToImg.text = ""
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        driverLicenseImg.image = image
        
        
        ref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        var data = Data()
        data = UIImageJPEGRepresentation(driverLicenseImg.image!, 0.8)!
        
        let storage = Storage.storage()
        let storageRef = storage.reference(forURL: "gs://indianayouthservices.appspot.com")
        
        let driversPicRef = storageRef.child(userID!)
        
        _ = driversPicRef.putData(data, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {
                return
            }
            _ = metadata.downloadURL
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backToMain(_ sender: Any) {
        self.performSegue(withIdentifier: "backToMain", sender: self)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil) 
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
}
