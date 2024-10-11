//
//  RequestProvider.swift
//  Albaid
//
//  Created by 박지윤 on 10/8/24.
//

import Moya

//typealias ExampleProvider = RequestProvider<ExampleAPI>

final class RequestProvider<Target: TargetType>: MoyaProvider<Target> {

    // MARK: Initializer
    init(session: Session) {
        super.init(session: session, plugins: [])
    }
}
