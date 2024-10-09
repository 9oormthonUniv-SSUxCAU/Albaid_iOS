//
//  ErrorResponse.swift
//  Albaid
//
//  Created by 박지윤 on 10/8/24.
//

struct ErrorResponse: Codable {
    let timeStamp: String?
    let status: Int?
    let error: String?
    let message: String?
}
