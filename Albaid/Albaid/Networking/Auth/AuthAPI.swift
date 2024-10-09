//
//  AuthAPI.swift
//  Albaid
//
//  Created by 박지윤 on 10/8/24.
//

import Moya
import Foundation

enum AuthAPI {
//    case postRefresh
    case getLogin(provider: String)
    case getSuccess
//    case getSuccess(type: String,
//                    accessToken: String,
//                    refreshToken: String,
//                    accessTokenExpiresIn: String,
//                    refreshTokenExpiresIn: String)
//    case getFailure
}

extension AuthAPI: TargetType {
    var path: String {
        switch self {
//        case .postRefresh:
//            return URLConst.refresh
        case .getLogin(let provider):
            return URLConst.login + "/\(provider)"
        case .getSuccess:
            return URLConst.success
//        case .getFailure:
//            return URLConst.failure
        }
    }
    
    var method: Moya.Method {
        switch self {
//        case .postRefresh:
//            return .post
//        case .getSuccess, .getFailure:
//            return .get
        case .getLogin:
            return .get
        case .getSuccess:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .getLogin:
            return .requestPlain
        case .getSuccess:
            return .requestPlain
        }
//        case .getSuccess(let type, let accessToken, let refreshToken, let accessTokenExpiresIn, let refreshTokenExpiresIn):
//            return .requestParameters(parameters: [
//                "type": type,
//                "accessToken": accessToken,
//                "refreshToken": refreshToken,
//                "accessTokenExpiresIn": accessTokenExpiresIn,
//                "refreshTokenExpiresIn": refreshTokenExpiresIn
//            ], encoding: JSONEncoding.default)
//        }
    }
}
