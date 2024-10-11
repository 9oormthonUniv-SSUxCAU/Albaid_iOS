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
    let result: [ContractList]
}

struct ContractList: Codable {
    let id: Int
    let url: URL
    let title: String
}

struct ContractUploadResponse: Codable {
    let isSuccess: Bool
    let message: String
    let result: ContractUpload
}

struct ContractUpload: Codable {
    let workplace: String?
    let contractStartDate: String?
    let contractEndDate: String?
    let standardWorkingStartTime: String?
    let standardWorkingEndTime: String?
    let workingDays: [String]?
    let hourlyWage: Int?
    let jobDescription: String?
    let isPaidAnnualLeave: Bool
    let isSocialInsurance: Bool
    let isContractDelivery: Bool
    let isSafe: Bool
}


struct ContractRequestResponse: Codable {
    let isSuccess: Bool
    let message: String
    let result: ContractRequest
}

struct ContractRequest: Codable {
    let id: Int
    let url: String
    let title: String
    let workplace: String
    let contractStartDate: String
    let contractEndDate: String?
    let standardWorkingStartTime: String
    let standardWorkingEndTime: String
    let workingDays: [String]
    let hourlyWage: Int
    let jobDescription: String
    let isPaidAnnualLeave: Bool
    let isSocialInsurance: Bool
    let isContractDelivery: Bool
    let memo: String
}
