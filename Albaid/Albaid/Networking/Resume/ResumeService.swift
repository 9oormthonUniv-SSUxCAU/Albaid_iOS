//
//  ResumeService.swift
//  Albaid
//
//  Created by 박지윤 on 10/10/24.
//

import Foundation
import Moya

final class ResumeService {

    private var resumeProvider = MoyaProvider<ResumeAPI>(plugins: [MoyaLoggerPlugin()])

    private enum ResponseData {
        case postResume(request: ResumeInput)
        case getResume
        case getResumeId(id: Int)
        case putResumeId(id: Int, request: ContractInput)
        case deleteResumeId(id: Int)
    }

    public func getResume(completion: @escaping (NetworkResult<Any>) -> Void) {
        resumeProvider.request(.getResume) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data

                let networkResult = self.judgeStatus(by: statusCode, data, responseData: .getResume)
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
            case .getResume, .postResume, .getResumeId, .putResumeId, .deleteResumeId:
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
        case .getResume:
            let decodedData = try? decoder.decode(ResumeListResponse.self, from: data)
            return .success(decodedData ?? "success")
        case .postResume(request: let request):
            let decodedData = try? decoder.decode(ResumeListResponse.self, from: data)
            return .success(decodedData ?? "success")
        case .getResumeId(id: let id):
            let decodedData = try? decoder.decode(ResumeListResponse.self, from: data)
            return .success(decodedData ?? "success")
        case .putResumeId(id: let id, request: let request):
            let decodedData = try? decoder.decode(ResumeListResponse.self, from: data)
            return .success(decodedData ?? "success")
        case .deleteResumeId(id: let id):
            let decodedData = try? decoder.decode(ResumeListResponse.self, from: data)
            return .success(decodedData ?? "success")
        }
    }
}
