//
//  SignUpTableViewController.swift
//  TheraConnect
//
//  Created by CC Katz on 8/30/18.
//  Copyright © 2018 CC Katz. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class SignUpTableViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var userTypeSegment: UISegmentedControl!
    @IBOutlet weak var signUpButton: UIButton!

    var ref: DatabaseReference!

    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func signUpButtonTapped(_ sender: Any) {
        guard let userName = nameTextField.text else { return }
        guard passwordTextField.text == confirmPasswordTextField.text else {
            self.presentAlert("Error", message: "Passwords must match")
            return
        }

        guard let password = passwordTextField.text else { return }
        guard let email = emailTextField.text else { return }

        let userType: UserType = userTypeSegment.selectedSegmentIndex == 0 ? .doctor : .patient

        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (authResult, error) in

            if let error = error {
                self?.presentAlert("Error", message: error.localizedDescription)
            }

            guard let user = authResult?.user else { return }

            let profileUpdate = Auth.auth().currentUser?.createProfileChangeRequest()
            profileUpdate?.displayName = userName
            profileUpdate?.commitChanges(completion: { (error) in
                self?.presentAlert("Error", message: error?.localizedDescription)
            })

            self?.ref.child("users").child(user.uid).setValue([
                "username": userName,
                "userType": userType.rawValue
                ])

            UserDefaults.standard.set(email, forKey: "username")
            
            self?.performSegue(withIdentifier: "signedUp", sender: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        setUpKeyboardFunctions()

        [nameTextField,
         emailTextField,
         passwordTextField,
         confirmPasswordTextField]
            .forEach { $0?.delegate = self }
    }

}

extension SignUpTableViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            confirmPasswordTextField.becomeFirstResponder()
        case confirmPasswordTextField:
            textField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }

        return false
    }

}
