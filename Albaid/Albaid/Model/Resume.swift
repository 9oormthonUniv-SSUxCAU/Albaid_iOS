//
//  Resume.swift
//  Albaid
//
//  Created by 박지윤 on 10/5/24.
//

import Foundation

struct Resume {
    let id: Int
    let name: String
    let title: String
    let summary: String
    let phone: String
    let email: String
    let address: String
    let finalEducation: String
    let desiredLocation: String
    let desiredJob: String
    let totalCareerDuration: String
    let careers: [Career]
}

struct Career {
    let companyName: Int
    let startDate: Date
    let endDate: Date
}

//extension Resume {
//    static let dummyResume = [Resume(id: 0,
//                                     name: "",
//                                     title: <#T##String#>,
//                                     summary: <#T##String#>,
//                                     phone: <#T##String#>,
//                                     email: <#T##String#>,
//                                     address: <#T##String#>,
//                                     finalEducation: <#T##String#>,
//                                     desiredLocation: <#T##String#>,
//                                     desiredJob: <#T##String#>,
//                                     totalCareerDuration: <#T##String#>,
//                                     careers: <#T##[Career]#>),
//                              Resume(id: 1,
//                                    name: <#T##String#>,
//                                     title: <#T##String#>,
//                                     summary: <#T##String#>,
//                                     phone: <#T##String#>,
//                                     email: <#T##String#>,
//                                     address: <#T##String#>,
//                                     finalEducation: <#T##String#>,
//                                     desiredLocation: <#T##String#>,
//                                     desiredJob: <#T##String#>,
//                                     totalCareerDuration: <#T##String#>,
//                                     careers: <#T##[Career]#>)
//    ]
//
//}
