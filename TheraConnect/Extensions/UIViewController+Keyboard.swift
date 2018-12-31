//
//  UIViewController+Keyboard.swift
//  TheraConnect
//
//  Created by Victor Zhong on 12/30/18.
//  Copyright © 2018 CC Katz. All rights reserved.
//

import Foundation

extension UIViewController {

    func setUpKeyboardFunctions(moveView: Bool = false) {
        addTapToDismissKeyboard()

        if moveView {
            addObserversForKeyboard()
        }
    }

    func addTapToDismissKeyboard() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }

    func addObserversForKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    func removeObserversForKeyboard() {
        NotificationCenter.default
            .removeObserver(NSNotification.Name.UIKeyboardWillShow)
        NotificationCenter.default
            .removeObserver(NSNotification.Name.UIKeyboardWillHide)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height

            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y = 0
        }
    }

    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
}
