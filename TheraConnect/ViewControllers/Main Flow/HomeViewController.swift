//
//  HomeViewController.swift
//  TheraConnect
//
//  Created by CC Katz on 10/2/18.
//  Copyright © 2018 CC Katz. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase

class HomeViewController: UIViewController {

    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        setUpSidebar()
        
        // TODO: - Load notes
//        let doc = User(id: "12345", name: "Dr. Chicken", email: "drchick@en.com", username: "what", type: .doctor, relationships: nil)
//
//        testNote(doc)
    }

    func createNote(_ recipient: User) {
        guard let user = LoggedInUser.shared.user else { return }

        let key = ref.childByAutoId().key
        let now = DateManager.shared.createNowDateString()
        
        let testNote = Note(message: "Hello", date: now, doctorName: recipient.name, patientName: user.name, ID: nil, doctorID: nil, patientID: user.email)

        self.ref.child("notes").child(key).setValue([
            "message": testNote.message,
            "date": testNote.date,
            "doctorName": testNote.doctorName,
            "patientName": testNote.patientName,
            "id": key
            ])

        print(DateManager.shared.convertString(now, format: .long))
    }

}
