//
//  DateManager.swift
//  TheraConnect
//
//  Created by Victor Zhong on 1/1/19.
//  Copyright © 2019 CC Katz. All rights reserved.
//

import Foundation

enum ReadableDateFormat {
    case long, short
}

class DateManager {
    static let shared = DateManager()
    private init() {
        dateFormatter.dateFormat = dateFormat
    }

    private let dateFormatter = DateFormatter()
    private let readableFormatter = DateFormatter()
    private let dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    private let readableLongFormat = "MM/dd/yyyy, h:mm a"
    private let readableShortFormat = "MM/dd/yyyy"

    func createNowDateString() -> String {
        let date = Date()

        return dateFormatter.string(from: date)
    }

    func convertString(_ str: String, format: ReadableDateFormat) -> String? {
        guard let date = dateFormatter.date(from: str) else { return nil }

        switch format {
        case .long:
            readableFormatter.dateFormat = readableLongFormat
        case .short:
            readableFormatter.dateFormat = readableShortFormat
        }

        return readableFormatter.string(from: date)
    }

}
