//
//  UIViewController+Alert.swift
//  TheraConnect
//
//  Created by Victor Zhong on 12/30/18.
//  Copyright © 2018 CC Katz. All rights reserved.
//

import Foundation

extension UIViewController {

    func presentAlert(_ title: String, message: String?, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)

        self.present(alert, animated: true, completion: completion)
    }

}
