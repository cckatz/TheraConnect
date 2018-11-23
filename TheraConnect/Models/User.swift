//
//  File.swift
//  TheraConnect
//
//  Created by CC Katz on 8/30/18.
//  Copyright © 2018 CC Katz. All rights reserved.
//

import Foundation

enum UserType: String {
    case guardian, patient, therapist
}

class User {
    let name: String
    let email: String
    let username: String
    let type: UserType
    init(name: String, email: String, username: String, type: UserType) {
        self.name = name
        self.email = email
        self.username = username
        self.type = type
    }
}


