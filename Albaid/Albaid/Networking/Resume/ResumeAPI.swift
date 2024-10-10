//
//  ResumeAPI.swift
//  Albaid
//
//  Created by 박지윤 on 10/10/24.
//

import Moya
import Foundation

enum ResumeAPI {
    case getResume
}

extension ResumeAPI: TargetType {
    var path: String {
        switch self {
        case .getResume:
            return URLConst.success
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getResume:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .getResume:
            return .requestPlain
        }
    }
}

