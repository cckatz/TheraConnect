//
//  MenuTableViewController.swift
//  TheraConnect
//
//  Created by Victor Zhong on 12/31/18.
//  Copyright © 2018 CC Katz. All rights reserved.
//

import UIKit
import FirebaseAuth

class MenuTableViewController: UITableViewController {

    @IBAction func logoutButtonTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
        }
        catch {
            presentAlert("Error", message: error.localizedDescription)
        }
    }

}
