//
//  LoggedInUser.swift
//  TheraConnect
//
//  Created by Victor Zhong on 1/1/19.
//  Copyright © 2019 CC Katz. All rights reserved.
//

import Foundation
import Firebase

class LoggedInUser {
    static let shared = LoggedInUser()
    private init() {}

    private var _user: User? {
        didSet {
            createDict()
        }
    }

    public var user: User? {
        return _user
    }

    var relationshipDict: [String : User]?

    public func applyUser(_ user: User) {
        _user = user
    }

    private func createDict() {
        guard let relationships = _user?.relationships else { return }
        // TODO: - Create Dict
        print(relationships)
    }
}
