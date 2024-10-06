//
//  DateFormatter.swift
//  Albaid
//
//  Created by 박지윤 on 10/6/24.
//

import Foundation

extension String {
    func toTimeDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
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
