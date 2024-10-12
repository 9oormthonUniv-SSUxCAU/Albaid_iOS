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
    let desiredJob: String?
    let desiredLocation: String?
}

struct ResumeRequestResponse: Codable {
    let isSuccess: Bool
    let message: String
    let result: ResumeRequest
}

struct ResumeRequest: Codable {
    let title: String
    let summary: String
    let phone: String
    let address: String
    let email: String
    let finalEducation: String
    let desiredLocation: String
    let desiredJob: String
    let careers: [Careers]
    let qualifications: String
}

struct Careers: Codable {
    let companyName: String
    let occupation: String
    let startDate: String
    let endDate: String
}
