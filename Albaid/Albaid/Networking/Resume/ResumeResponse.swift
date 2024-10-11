//
//  ResumeResponse.swift
//  Albaid
//
//  Created by 박지윤 on 10/10/24.
//

import Foundation

struct ResumeListResponse: Codable {
    let isSuccess: Bool
    let message: String
    let result: [ResumeList]
}

struct ResumeList: Codable {
    let id: Int
    let createdAt: String
    let title: String
    let desiredJob: String
    let desiredLocation: String
}
