//
//  ContractAPI.swift
//  Albaid
//
//  Created by 박지윤 on 10/9/24.
//

import Moya
import Foundation

enum ContractAPI {
    case getContract
}

extension ContractAPI: TargetType {
    var path: String {
        switch self {
        case .getContract:
            return URLConst.contract
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getContract:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .getContract:
            return .requestPlain
        }
    }
}
