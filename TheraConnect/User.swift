//
//  File.swift
//  TheraConnect
//
//  Created by CC Katz on 8/30/18.
//  Copyright © 2018 CC Katz. All rights reserved.
//

import Foundation

class User {
    let name: String
    let email: String
    let username: String
    let type: User
    init(name: String, email: String, username: String, type: User) {
        self.name = name
        self.email = email
        self.username = username
        self.type = type
    }
}
class Guardian: User {}
class Patient: User {
    
}
class Therapist: User {
    
}
