//
//  LogInTableViewController.swift
//  TheraConnect
//
//  Created by CC Katz on 8/30/18.
//  Copyright © 2018 CC Katz. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInTableViewController: UITableViewController {
 
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func logInButtonTapped(_ sender: Any) {
        signIn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpKeyboardFunctions()

        [usernameTextField, passwordTextField].forEach { $0?.delegate = self }

        if let username = UserDefaults.standard.string(forKey: "username"),
            let password = UserDefaults.standard.string(forKey: "password") {
            usernameTextField.text = username
            passwordTextField.text = password
        }

      // Auth.auth().signIn(withEmail: self.email, password: self.password) { (user, error) in
            // [START_EXCLUDE]
//            self.hideSpinner {
//                if let error = error {
//                    self.showMessagePrompt(error.localizedDescription)
//                    return
//                }
//                self.navigationController!.popViewController(animated: true)
//            }
//            // [END_EXCLUDE]
//        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    fileprivate func signIn() {
        guard let username = usernameTextField.text else { return }
        guard let password = passwordTextField.text else { return }

        Auth.auth().signIn(
            withEmail: username,
            password: password
        ) { [weak self] (user, error) in
            if error == nil {
                UserDefaults.standard.set(username, forKey: "username")
                UserDefaults.standard.set(password, forKey: "password")

                self?.performSegue(withIdentifier: "login", sender: self)
            } else {
                self?.presentAlert("Error", message: error?.localizedDescription)
            }
        }
    }

}

extension LogInTableViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        }

        if textField == passwordTextField {
            textField.resignFirstResponder()
            signIn()
        }

        return true
    }

}
