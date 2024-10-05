//
//  Resume.swift
//  Albaid
//
//  Created by 박지윤 on 10/5/24.
//

import Foundation

struct Resume {
    let id: Int
    let name: String
    let title: String
    let summary: String
    let phone: String
    let email: String
    let address: String
    let finalEducation: String
    let desiredLocation: String
    let desiredJob: String
    let totalCareerDuration: String
    let contracts: [Contract]
}
