//
//  NetworkService.swift
//  Albaid
//
//  Created by 박지윤 on 10/8/24.
//

final class NetworkService {
    static let shared = NetworkService()
    
    private init() { }
    
    let auth = AuthService()
    let contract = ContractService()
//    let resume = ResumeService()
}
