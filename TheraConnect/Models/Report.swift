//
//  Report.swift
//  TheraConnect
//
//  Created by CC Katz on 11/23/18.
//  Copyright © 2018 CC Katz. All rights reserved.
//

import Foundation

class Note {
    let message: String
    let date: String
    let doctorName: String
    let patientName: String
    let ID: String?
    let doctorID: String?
    let patientID: String?

    init(
        message: String,
        date: String,
        doctorName: String,
        patientName: String,
        ID: String?,
        doctorID: String?,
        patientID: String?) {
        self.message = message
        self.date = date
        self.doctorName = doctorName
        self.patientName = patientName
        self.ID = ID
        self.doctorID = doctorID
        self.patientID = patientID
    }

}
