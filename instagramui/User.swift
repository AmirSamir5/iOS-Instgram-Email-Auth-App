//
//  User.swift
//  Moments
//
//  Created by Duc Tran on 10/9/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

import UIKit

class User
{
    let uid: String
    var username: String
    var profileImage: UIImage?
    var fullname: String
    var email: String
    
    init(uid:String, username:String, profileImage: UIImage, fullname: String, email: String) {
        self.uid = uid
        self.username = username
        self.profileImage = profileImage
        self.fullname = fullname
        self.email = email
    }
    init(username:String, profileImage: UIImage?){
        self.username = username
        self.profileImage = profileImage
        self.uid = ""
        self.fullname = ""
        self.email = ""
    }
    
    func toDictionary() -> [String: Any]{
        return [
            "uid": uid,
            "username": username,
            "fullname": fullname,
            "email": email
        ]
    }
    
    func save(completion: @escaping (Error?) -> Void){
        let ref = FIRDatabaseReference.users(uid: uid).reference()
        ref.setValue(toDictionary())
        if let profileImage = profileImage {
            let firImage = FIRImage.init(image: profileImage)
            firImage.saveProfileImage(uid) { (error) in
                completion(error)
            }
        }
    }
}























