//
//  ContractResponse.swift
//  Albaid
//
//  Created by 박지윤 on 10/9/24.
//

import Foundation

struct ContractListResponse: Codable {
    let isSuccess: Bool
    let message: String
    let result: [ContractGet]
}

struct ContractGet: Codable {
    let id: Int
    let url: URL
    let title: String
}

struct ContractUploadResponse: Codable {
    let isSuccess: Bool
    let message: String
    let result: [ContractUpload]
}

struct ContractUpload: Codable {
    let workplace: String
    let contractStartDate: Date
    let contractEndDate: Date?
    let standardWorkingStartTime: Date
    let standardWorkingEndTime: Date
    let workingDays: [String]
    let hourlyWage: Int
    let jobDescription: String
    let isPaidAnnualLeave: Bool
    let isSocialInsurance: Bool
    let isContractDelivery: Bool
}
