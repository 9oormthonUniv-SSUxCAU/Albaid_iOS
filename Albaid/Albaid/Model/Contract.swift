//
//  Contract.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import Foundation

struct Contract {
    let id: Int
    let url: String
    let title: String
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
    let memo: String?
}

struct ContractInput {
    let workplace: String?
    let contractStartDate: String?
    let contractEndDate: String?
    let standardWorkingStartTime: String?
    let standardWorkingEndTime: String?
    let workingDays: [String]?
    let hourlyWage: Int?
    let jobDescription: String?
    let isPaidAnnualLeave: Bool?
    let isSocialInsurance: Bool?
    let isContractDelivery: Bool?
    let memo: String?
}

extension Contract {
    static let dummyContract = [Contract(id: 0,
                                         url: "https://albaid-files",
                                         title: "알바 카드 1",
                                         workplace: "투썸 플레이스 광교점",
                                         contractStartDate: "2024.07.23".toDate(format: "yyyy.MM.dd") ?? Date(),
                                         contractEndDate: nil,
                                         standardWorkingStartTime: "13:00".toTimeDate() ?? Date(),
                                         standardWorkingEndTime: "18:00".toTimeDate() ?? Date(),
                                         workingDays: ["월", "화", "수"],
                                         hourlyWage: 10000,
                                         jobDescription: "음료 제조",
                                         isPaidAnnualLeave: false,
                                         isSocialInsurance: false,
                                         isContractDelivery: true,
                                         memo: "abc"),
                                Contract(id: 1,
                                         url: "https://albaid-files",
                                         title: "알바 카드 2",
                                         workplace: "GS25 숭실대점",
                                         contractStartDate: "2024.07.23".toDate(format: "yyyy.MM.dd") ?? Date(),
                                         contractEndDate: "2024.09.23".toDate(format: "yyyy.MM.dd") ?? Date(),
                                         standardWorkingStartTime: "12:00".toTimeDate() ?? Date(),
                                         standardWorkingEndTime: "14:30".toTimeDate() ?? Date(),
                                         workingDays: ["수", "목", "금"],
                                         hourlyWage: 9860,
                                         jobDescription: "상품 판매 및 매장관리",
                                         isPaidAnnualLeave: false,
                                         isSocialInsurance: false,
                                         isContractDelivery: true,
                                         memo: "테스트 메모")]
}

extension ContractInput {
    static let dummyContractInput = ContractInput(workplace: "투썸",
                                                  contractStartDate: "2024-07-23",
                                                  contractEndDate: "2024-09-27",
                                                  standardWorkingStartTime: "13:00",
                                                  standardWorkingEndTime: "18:00",
                                                  workingDays: ["월", "화"],
                                                  hourlyWage: nil,
                                                  jobDescription: "상품 판매와 매장관리 및 관련부대 업무",
                                                  isPaidAnnualLeave: false,
                                                  isSocialInsurance: false,
                                                  isContractDelivery: true,
                                                  memo: "abc")
}
