//
//  ContractResponse.swift
//  Albaid
//
//  Created by 박지윤 on 10/9/24.
//

import Foundation

struct ContractResponse: Codable {
    let isSuccess: Bool
    let message: String
    let result: [ContractGet]
}

struct ContractGet: Codable {
    let id: Int
    let url: URL
    let title: String
}
