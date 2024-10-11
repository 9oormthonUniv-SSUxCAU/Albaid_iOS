//
//  IntFormatter.swift
//  Albaid
//
//  Created by 박지윤 on 9/28/24.
//

import Foundation

extension Int {
    var toPriceFormat: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }

    var toMonthFormat: String {
        return "\(self)월"
    }
}

extension String {
    var revertPriceFormat: Int {
        let priceInt = self.replacingOccurrences(of: ",", with: "")
        return Int(priceInt) ?? 0
    }
}
