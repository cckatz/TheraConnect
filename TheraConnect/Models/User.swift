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
    let id: String
    let name: String
    let email: String
    let type: UserType
    let relationships: [String]?

    init(id: String, name: String, email: String, type: UserType, relationships: [String]?) {
        self.id = id
        self.name = name
        self.email = email
        self.type = type
        self.relationships = relationships

    }
}


