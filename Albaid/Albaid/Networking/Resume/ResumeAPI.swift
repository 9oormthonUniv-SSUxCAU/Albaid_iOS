//
//  ResumeAPI.swift
//  Albaid
//
//  Created by 박지윤 on 10/10/24.
//

import Moya
import Foundation

enum ResumeAPI {
    case postResume(request: ResumeInput)
    case getResume
    case getResumeId(id: Int)
    case putResumeId(id: Int, request: ContractInput)
    case deleteResumeId(id: Int)
}

extension ResumeAPI: TargetType {
    var path: String {
        switch self {
        case .postResume, .getResume:
            return URLConst.resume
        case .getResumeId(let contractId):
            return URLConst.resume + "/\(contractId)"
        case .putResumeId(let contractId, _):
            return URLConst.resume + "/\(contractId)"
        case .deleteResumeId(let contractId):
            return URLConst.resume + "/\(contractId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getResume, .getResumeId:
            return .get
        case .postResume:
            return .get
        case .putResumeId:
            return .put
        case .deleteResumeId:
            return .delete
        }
    }

    var task: Moya.Task {
        switch self {
        case .getResume:
            return .requestPlain
        case .getResumeId(let id):
            return .requestParameters(parameters: [
                "id": id
            ], encoding: URLEncoding.default)
        case .postResume(let request):
            let request = try! JSONEncoder().encode(request)
            return .requestCompositeData(bodyData: request, urlParameters: [:])
        case .deleteResumeId(let id):
            return .requestParameters(parameters: [
                "id": id
            ], encoding: URLEncoding.default)
        case .putResumeId(_, let request):
            let request = try! JSONEncoder().encode(request)
            return .requestCompositeData(bodyData: request, urlParameters: [:])
        }
    }
}

