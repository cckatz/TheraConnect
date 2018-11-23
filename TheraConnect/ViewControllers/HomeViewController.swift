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
        setUpSidebar ()
        testNote()
        
        // Do any additional setup after loading the view.
    }

    
    func testNote () {
//        class Note {
//            let message: String
//            let date: String
//            let doctorName: String
//            let patientName: String
//            let ID: String?
//            let doctorID: String?
//            let patientID: String?
        
        let testNote = Note(message: "Hello", date: "10/22/18", doctorName: "Dr. Dan", patientName: "Jane", ID: nil, doctorID: nil, patientID: nil)
        
    
//    self.ref.child("users").child(user.uid).setValue([
//    "username": self.nameTextField.text!,
//    "userType":userType
//
//    ])
        self.ref.child("note").childByAutoId().setValue([
            "message": testNote.message,
            "date": testNote.date,
            "doctorName": testNote.doctorName,
            "patientName": testNote.patientName
            
            
            
            
            ]
            
        
        )
        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
