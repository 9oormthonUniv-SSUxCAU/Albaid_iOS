//
//  TargetType+Extension.swift
//  Albaid
//
//  Created by 박지윤 on 10/8/24.
//

import Foundation
import Moya

extension TargetType {
    var baseURL: URL {
        URL(string: URLConst.base)!
    }
    
    var headers: [String : String]? {
        let header = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(UserDefaultHandler.accessToken)"
        ]
        return header
    }
}
