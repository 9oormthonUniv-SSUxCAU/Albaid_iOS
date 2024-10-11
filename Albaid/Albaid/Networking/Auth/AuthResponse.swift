//
//  AuthResponse.swift
//  Albaid
//
//  Created by 박지윤 on 10/8/24.
//

import Foundation

struct AuthLoginResponse: Codable {
    let isSuccess: Bool
    let message: String
    let result: URL
}

struct AuthSuccessResponse: Codable {
    let isSuccess: Bool
    let message: String
    let result: AuthSuccessResult
}

struct AuthSuccessResult: Codable {
    let type: String
    let accessToken: String
    let refreshToken: String
    let accessTokenExpiresIn: Int
    let refreshTokenExpiresIn: Int
}
