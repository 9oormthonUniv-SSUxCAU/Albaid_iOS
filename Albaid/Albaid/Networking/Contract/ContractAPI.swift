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
}

extension ContractAPI: TargetType {
    var path: String {
        switch self {
        case .postContractUpload:
            return URLConst.contractUpload
        case .postContract, .getContract:
            return URLConst.contract
        }
    }

    var method: Moya.Method {
        switch self {
        case .postContractUpload, .postContract:
            return .post
        case .getContract:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .postContractUpload(let contractImage):
            let formData = MultipartFormData(provider: .data(contractImage), name: "contractImage", fileName: "album@3x.png", mimeType: "image/png")
            return .uploadMultipart([formData])
        case .postContract(let contractImage, let request):
            var formData = [MultipartFormData]()
            
            let imageData = MultipartFormData(provider: .data(contractImage), name: "contractImage", fileName: "album@3x.png", mimeType: "image/png")
            formData.append(imageData)
            
            if let jsonData = try? JSONSerialization.data(withJSONObject: request, options: []) {
                let jsonFormData = MultipartFormData(provider: .data(jsonData), name: "metadata", fileName: "metadata.json", mimeType: "application/json")
                formData.append(jsonFormData)
            }
            
            return .uploadMultipart(formData)
        case .getContract:
            return .requestPlain
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
        case .getContract:
            let header = [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(UserDefaultHandler.accessToken)"
            ]
            return header
        }
    }
}
