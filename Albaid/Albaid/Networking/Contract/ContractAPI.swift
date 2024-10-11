//
//  ContractAPI.swift
//  Albaid
//
//  Created by 박지윤 on 10/9/24.
//

import Moya
import Foundation

enum ContractAPI {
    case postContractUpload(contractImage: Data)
    case postContract(contractImage: Data, request: ContractInput)
    case getContract
    case getContractId(contractId: Int)
}

extension ContractAPI: TargetType {
    var path: String {
        switch self {
        case .postContractUpload:
            return URLConst.contractUpload
        case .postContract, .getContract:
            return URLConst.contract
        case .getContractId(let contractId):
            return URLConst.contract + "/\(contractId)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .postContractUpload, .postContract:
            return .post
        case .getContract, .getContractId:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .postContractUpload(let contractImage):
            let formData = MultipartFormData(provider: .data(contractImage), name: "contractImage", fileName: "album@3x.png", mimeType: "image/png")
            return .uploadMultipart([formData])
        case .postContract(let contractImage, let request):
            let jsonData = try! JSONEncoder().encode(request)
            let jsonMultipart = MultipartFormData(provider: .data(jsonData), name: "request", fileName: "request.json", mimeType: "application/json")
            let imageMultipart = MultipartFormData(provider: .data(contractImage), name: "contractImage", fileName: "contract.jpg", mimeType: "image/jpeg")
            let multipartData = [jsonMultipart, imageMultipart]
            return .uploadMultipart(multipartData)
        case .getContract:
            return .requestPlain
        case .getContractId(let contractId):
            return .requestParameters(parameters: [
                "contractId": contractId
            ], encoding: URLEncoding.default)
        }
    }

    var headers: [String : String]? {
        switch self {
        case .postContractUpload, .postContract:
            let header = [
                "Content-Type": "multipart/form-data",
                "Authorization": "Bearer \(UserDefaultHandler.accessToken)"
            ]
            return header
        case .getContract, .getContractId:
            let header = [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(UserDefaultHandler.accessToken)"
            ]
            return header
        }
    }
}
