//
//  WelcomeViewController.swift
//  InstagramUI
//
//  Created by Mac on 5/23/18.
//  Copyright © 2018 Developers Academy. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }

}
