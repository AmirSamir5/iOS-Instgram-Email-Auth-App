//
//  SignUpTableViewController.swift
//  InstagramUI
//
//  Created by Mac on 5/23/18.
//  Copyright © 2018 Developers Academy. All rights reserved.
//

import UIKit
import Firebase

class SignUpTableViewController: UITableViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var EmailAddressTxt: UITextField!
    @IBOutlet weak var FullNameTxt: UITextField!
    @IBOutlet weak var UsernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    
    let imagePickerController = UIImagePickerController()
    var profilePicture: UIImage? = nil
    var errorMsg: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
    }
    
    @IBAction func changeProfilePressed(_ sender: Any){
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2
        profileImage.layer.masksToBounds = true
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a Source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            self.imagePickerController.sourceType = .camera
            self.present(self.imagePickerController, animated: true, completion: nil)
        }))
        
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true, completion: nil)
        }))
        
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func createNewAccountPressed(_ sender: Any){
        if profileImage.image != UIImage(named: "icon-defaultAvatar") && EmailAddressTxt.text != "" && FullNameTxt.text != "" && UsernameTxt.text != "" && (passwordTxt.text?.count)! >= 6{
            let username = UsernameTxt.text
            let email = EmailAddressTxt.text
            let fullName = FullNameTxt.text
            let password = passwordTxt.text
            
            Auth.auth().createUser(withEmail: email!, password: password!) { (firUser, error) in
                if error != nil{
                    print(error.debugDescription)
                }else if let firUser = firUser{
                    let newUser = User(uid: (firUser.uid), username: username!, profileImage: self.profilePicture!, fullname: fullName!, email: email!)
                    newUser.save(completion: { (error) in
                        if error != nil {
                            print(error.debugDescription)
                        }else{
                            Auth.auth().signIn(withEmail: email!, password: password!, completion: { (firUser, error) in
                                if error != nil {
                                    
                                }else{
                                    self.dismiss(animated: true, completion: nil)
                                }
                            })
                        }
                    })
                }
            }
        }else{
            if profileImage.image == UIImage(named: "icon-defaultAvatar"){
                errorMsg = "- Please Select Photo \n"
            }
            if EmailAddressTxt.text == ""{
                errorMsg += "- Email is Empty \n"
            }
            if FullNameTxt.text == ""{
                errorMsg += "- Name is Empty \n"
            }
            if UsernameTxt.text == ""{
                errorMsg += "- Username is Empty \n"
            }
            if (passwordTxt.text?.count)! < 6{
                errorMsg += "- Password is Empty"
            }
            if errorMsg != ""{
                alertAction(errorMsg: errorMsg)
                errorMsg = ""
            }
        }
    }
    @IBAction func backBtnPressed(_ sender: Any){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func alertAction(errorMsg: String){
        let alert = UIAlertController(title: "Warning!", message: errorMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.alignment = .left
//
//        let messageText = NSMutableAttributedString(
//            string: errorMsg,
//            attributes: [
//                NSAttributedStringKey.paragraphStyle: paragraphStyle,
//            ]
//        )
//
//        alert.setValue(messageText, forKey: "attributedMessage")

        self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        profileImage.image = image
        profilePicture = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}













