//
//  DateFormatter.swift
//  Albaid
//
//  Created by 박지윤 on 10/6/24.
//

import Foundation

extension String {
    func toDate(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "ko_KR")
//        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        return dateFormatter.date(from: self)
    }

    func toTimeDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale(identifier: "ko_KR")

        let calendar = Calendar.current
        let today = Date()

        if let timeDate = dateFormatter.date(from: self) {
            return calendar.date(bySettingHour: calendar.component(.hour, from: timeDate),
                                 minute: calendar.component(.minute, from: timeDate),
                                 second: 0,
                                 of: today)
        }

        return nil
    }
}

extension Date {
    func toDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: self)
    }

    func toTimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: self)
    }
}
