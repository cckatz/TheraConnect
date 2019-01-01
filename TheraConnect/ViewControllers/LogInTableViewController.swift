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

    // MARK: - Outlets and Properties

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet var loginButton: UIButton!
    @IBOutlet var signupButton: UIButton!
    
    @IBAction func logInButtonTapped(_ sender: Any) {
        signIn()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpKeyboardFunctions()
        setupTextFields()
    }

    // MARK: - Functions and Methods
    
    private func setupTextFields() {
        [usernameTextField, passwordTextField].forEach { $0?.delegate = self }
        passwordTextField.clearsOnBeginEditing = true

        if let username = UserDefaults.standard.string(forKey: "username") {
            usernameTextField.text = username
        }
    }

    private func signIn() {
        guard loginButton.isEnabled == true else { return }

        print("Signing in?")
        switchButtons(turnOn: false)

        guard let username = usernameTextField.text else { return }
        guard let password = passwordTextField.text else { return }

        Auth.auth().signIn(
            withEmail: username,
            password: password
        ) { [weak self] (user, error) in
            if error == nil {
                UserDefaults.standard.set(username, forKey: "username")
                UserDefaults.standard.set(password, forKey: "password")
                self?.switchButtons()
                self?.performSegue(withIdentifier: "login", sender: self)
            } else {
                self?.switchButtons()
                self?.presentAlert("Error", message: error?.localizedDescription)
            }
        }
    }

    private func switchButtons(turnOn: Bool = true) {
        [loginButton, signupButton].forEach { $0?.isEnabled = turnOn }
    }

}

extension LogInTableViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        }

        if textField == passwordTextField {
            signIn()
            textField.resignFirstResponder()
        }

        return true
    }

}
