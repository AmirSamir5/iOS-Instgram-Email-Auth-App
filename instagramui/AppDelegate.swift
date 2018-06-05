//
//  AppDelegate.swift
//  InstagramUI
//
//  Created by Duc Tran on 3/3/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
//        Database.database().reference().child("users/u1d2").setValue("Amir")
//        FirebaseReference.users(uid: "Amir").reference().setValue("Ameer")
//        let username = [
//            "username":"admin",
//            "uid":"admin"
//        ]
//        FIRDatabaseReference.users(uid: "admin").reference().setValue(username)
        IQKeyboardManager.shared.enable = true
        
        let image = UIImage(named: "duc")
        let firImage = FIRImage(image: image!)
        firImage.saveProfileImage("Amir") { (error) in
            print(error)
        }
        return true
    }

}

