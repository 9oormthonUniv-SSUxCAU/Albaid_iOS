//
//  ContractService.swift
//  Albaid
//
//  Created by 박지윤 on 10/9/24.
//

import Foundation
import Moya

final class ContractService {

    private var contractProvider = MoyaProvider<ContractAPI>(plugins: [MoyaLoggerPlugin()])

    private enum ResponseData {
        case postContractUpload(contractImage: Data)
        case getContract
    }

    public func postContractUpload(contractImage: Data, completion: @escaping (NetworkResult<Any>) -> Void) {
        contractProvider.request(.postContractUpload(contractImage: contractImage)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data

                let networkResult = self.judgeStatus(by: statusCode, data, responseData: .postContractUpload(contractImage: contractImage))
                completion(networkResult)

            case .failure(let error):
                print(error)
            }
        }
    }

    public func getContract(completion: @escaping (NetworkResult<Any>) -> Void) {
        contractProvider.request(.getContract) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data

                let networkResult = self.judgeStatus(by: statusCode, data, responseData: .getContract)
                completion(networkResult)

            case .failure(let error):
                print(error)
            }
        }
    }

    private func judgeStatus(by statusCode: Int, _ data: Data, responseData: ResponseData) -> NetworkResult<Any> {
        let decoder = JSONDecoder()

        switch statusCode {
        case 200..<300:
            switch responseData {
            case .getContract, .postContractUpload:
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
        case .getContract:
            let decodedData = try? decoder.decode(ContractListResponse.self, from: data)
            return .success(decodedData ?? "success")
        case .postContractUpload:
            let decodedData = try? decoder.decode(ContractUploadResponse.self, from: data)
            return .success(decodedData ?? "success")
        }
    }
}
