//
//  FirebaseReference.swift
//  InstagramUI
//
//  Created by Mac on 5/23/18.
//  Copyright © 2018 Developers Academy. All rights reserved.
//

import Foundation
import Firebase


enum FIRDatabaseReference{
    case root
    case users(uid:String)
    
    private var rootRef: DatabaseReference{
        return Database.database().reference()
    }
    
    private var path: String {
        switch self {
        case .root:
            return ""
        case .users(uid: let uid):
            return "users/\(uid)"
        }
    }
    
    func reference() -> DatabaseReference{
        switch self{
        case .root:
            return rootRef
        default:
            return rootRef.child(path)
        }
    }
}

enum FIRStorageReference{
    case root
    case profileImages
    
    private var rootRef: StorageReference{
        return Storage.storage().reference()
    }
    private var path: String{
        switch self{
        case .root:
            return ""
        default:
            return "profileImages"
        }
    }
    func reference() -> StorageReference{
        switch self{
        case .root:
            return rootRef
        case.profileImages:
            return rootRef.child(path)
        }
    }
}































