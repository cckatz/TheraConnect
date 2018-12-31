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

        
        
//        testNote()
    }

    func testNote () {
        let key = ref.childByAutoId().key

        let testNote = Note(message: "Hello", date: "10/22/18", doctorName: "Dr. Dan", patientName: "Jane", ID: nil, doctorID: nil, patientID: nil)

        self.ref.child("notes").child(key).setValue([
            "message": testNote.message,
            "date": testNote.date,
            "doctorName": testNote.doctorName,
            "patientName": testNote.patientName,
            "id": key
            ]
        )
    }

}
