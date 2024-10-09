//
//  AuthService.swift
//  Albaid
//
//  Created by 박지윤 on 10/8/24.
//

import Foundation
import Moya

final class AuthService {

    private var authProvider = MoyaProvider<AuthAPI>(plugins: [MoyaLoggerPlugin()])

    private enum ResponseData {
        case getLogin
        case getSuccess
    }

    public func getLogin(provider: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        authProvider.request(.getLogin(provider: provider)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data

                let networkResult = self.judgeStatus(by: statusCode, data, responseData: .getLogin)
                completion(networkResult)

            case .failure(let error):
                print(error)
            }
        }
    }

    public func getSuccess(completion: @escaping (NetworkResult<Any>) -> Void) {
        authProvider.request(.getSuccess) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data

                let networkResult = self.judgeStatus(by: statusCode, data, responseData: .getSuccess)
                completion(networkResult)

            case .failure(let error):
                print(error)
            }
        }
    }

//    public func getSuccess(type: String,
//                           accessToken: String,
//                           refreshToken: String,
//                           accessTokenExpiresIn: String,
//                           refreshTokenExpiresIn: String,
//                           completion: @escaping (NetworkResult<Any>) -> Void) {
//        authProvider.request(.getSuccess(type: type,
//                                         accessToken: accessToken,
//                                         refreshToken: refreshToken,
//                                         accessTokenExpiresIn: accessTokenExpiresIn,
//                                         refreshTokenExpiresIn: refreshTokenExpiresIn)) { result in
//            switch result {
//            case .success(let response):
//                let statusCode = response.statusCode
//                let data = response.data
//
//                let networkResult = self.judgeStatus(by: statusCode, data, responseData: .getSuccess)
//                completion(networkResult)
//
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data, responseData: ResponseData) -> NetworkResult<Any> {
        let decoder = JSONDecoder()

        switch statusCode {
        case 200..<300:
            switch responseData {
            case .getLogin, .getSuccess:
                return isValidData(data: data, responseData: responseData)
            }
        case 400..<500:
            guard let decodedData = try? decoder.decode(ErrorResponse.self, from: data) else {
                return .pathErr
            }
            return .requestErr(decodedData)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }

    private func isValidData(data: Data, responseData: ResponseData) -> NetworkResult<Any> {
        let decoder = JSONDecoder()

        switch responseData {
        case .getLogin:
            let decodedData = try? decoder.decode(AuthLoginResponse.self, from: data)
            return .success(decodedData ?? "success")
        case .getSuccess:
            let decodedData = try? decoder.decode(AuthSuccessResponse.self, from: data)
            return .success(decodedData ?? "success")
        }
    }
}

