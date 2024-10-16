//
//  URLConst.swift
//  Albaid
//
//  Created by 박지윤 on 10/8/24.
//

enum URLConst {
    // MARK: - baseURL
    static let base = "http://13.125.40.17/api"
    
    // MARK: - Auth
    static let refresh = "/auth/refesh"
    static let success = "/auth/success"
    static let login = "/auth/login"
    static let failure = "/auth/failure"
    
    // MARK: - Contract
    static let contract = "/contract"
    static let contractUpload = "/contract/upload"
    
    // MARK: - Resume
    static let resume = "/resume"
}
