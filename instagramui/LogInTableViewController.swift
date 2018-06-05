//
//  LogInTableViewController.swift
//  InstagramUI
//
//  Created by Mac on 6/4/18.
//  Copyright © 2018 Developers Academy. All rights reserved.
//

import UIKit
import Firebase

class LogInTableViewController: UITableViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    @IBAction func btnLoginPressed(_ sender: Any) {
        if txtEmail.text != "" && txtPassword.text != ""{
            
            let email = txtEmail.text!
            let password = txtPassword.text!
            
            Auth.auth().signIn(withEmail: email, password: password, completion: { (firUser, error) in
                if error != nil {
                    let alert = UIAlertController(title: "Warning!", message: error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }else{
                    if firUser == nil{
                        let alert = UIAlertController(title: "Warning!", message: "Please Try Again Later", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }else{
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            })
        }
    }
    
    @IBAction func btnBackPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
