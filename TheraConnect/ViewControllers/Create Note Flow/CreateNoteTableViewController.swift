//
//  CreateNoteTableViewController.swift
//  TheraConnect
//
//  Created by Victor Zhong on 1/1/19.
//  Copyright © 2019 CC Katz. All rights reserved.
//

import UIKit

class CreateNoteTableViewController: UITableViewController {

    // MARK: - Properties and Outlets

    @IBOutlet var recipientLabel: UILabel!
    @IBOutlet var messageTextView: UITextView!

    var recipient: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpKeyboardFunctions()
    }

    // MARK: - Functions and Methods

    @IBAction func selectRecipientButtonTapped(_ sender: Any) {
        presentRecipientActionSheet()
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        guard let _ = recipient else { return }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        if navigationController != nil {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }

    private func presentRecipientActionSheet() {
        let actionSheet = UIAlertController(title: "Select Recipient", message: nil, preferredStyle: .actionSheet)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        actionSheet.addAction(cancelAction)

        if LoggedInUser.shared.user != nil,
            let dict = LoggedInUser.shared.relationshipDict,
            dict.count > 0 {
            for value in dict.values {
                let action = UIAlertAction(title: value.name, style: .default) { [weak self] _ in
                    self?.recipient = value
                    self?.recipientLabel.text = "Recipient: \(value.name)"
                }

                actionSheet.addAction(action)
            }
        }

        self.present(actionSheet, animated: true, completion: nil)
    }

}
