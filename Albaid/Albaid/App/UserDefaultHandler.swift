//
//  UserDefaultHandler.swift
//  Albaid
//
//  Created by 박지윤 on 10/8/24.
//

struct UserDefaultHandler {
    @UserDefault(key: "accessToken", defaultValue: "")
    static var accessToken: String
    
    @UserDefault(key: "refreshToken", defaultValue: "")
    static var refreshToken: String

    @UserDefault(key: "accessTokenExpiresIn", defaultValue: 0)
    static var accessTokenExpiresIn: Int

    @UserDefault(key: "refreshTokenExpiresIn", defaultValue: 0)
    static var refreshTokenExpiresIn: Int

    @UserDefault(key: "loginStatus", defaultValue: false)
    static var loginStatus: Bool
}
