//
//  File.swift
//  TheraConnect
//
//  Created by CC Katz on 8/30/18.
//  Copyright © 2018 CC Katz. All rights reserved.
//

import Foundation

enum UserType: String {
    case doctor, patient
}

class User {
    let name: String
    let email: String
    let username: String
    let type: UserType
    let relationships: [String]?
    
    init(name: String, email: String, username: String, type: UserType, relationships: [String]?) {
        self.name = name
        self.email = email
        self.username = username
        self.type = type
        self.relationships = relationships
    }
}


