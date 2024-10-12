//
//  Resume.swift
//  Albaid
//
//  Created by 박지윤 on 10/5/24.
//

import Foundation

struct ResumeInput: Encodable {
    var title: String
    var summary: String
    var phone: String
    var address: String
    var email: String
    var finalEducation: String
    var desiredLocation: String
    var desiredJob: String
    var careers: [Careers]
    var qualifications: String
}

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
    let companyName: String
    let startDate: Date
    let endDate: Date
}

extension Resume {
    static let dummyResume = [Resume(id: 0,
                                     name: "김알바",
                                     title: "[기본] 김알바11",
                                     summary: "안녕하세요. 성실한 알바생 김알바입니다.1",
                                     phone: "010-1234-56781",
                                     email: "경기도 수원시 영통구1",
                                     address: "albaid@email.com1",
                                     finalEducation: "대학(4년제)1",
                                     desiredLocation: "서울 강남구1",
                                     desiredJob: "베이커리, 카페, 편의점1",
                                     totalCareerDuration: "2년 1개월 16일1",
                                     careers: [Career(companyName: "투썸 플레이스 광교점",
                                                     startDate: "23.01".toDate(format: "yy.MM") ?? Date(),
                                                     endDate: "23.12".toDate(format: "yy.MM") ?? Date()),
                                               Career(companyName: "CU 광교호수공원점",
                                                               startDate: "24.01".toDate(format: "yy.MM") ?? Date(),
                                                               endDate: "24.07".toDate(format: "yy.MM") ?? Date()),
                                               Career(companyName: "GS 숭실대점",
                                                               startDate: "24.8".toDate(format: "yy.MM") ?? Date(),
                                                               endDate: "24.09".toDate(format: "yy.MM") ?? Date())]),
                              Resume(id: 1,
                                    name: "김알바",
                                     title: "[기본] 김알바12",
                                     summary: "안녕하세요. 성실한 알바생 김알바입니다.2",
                                     phone: "010-1234-56782",
                                     email: "경기도 수원시 영통구2",
                                     address: "albaid@email.com2",
                                     finalEducation: "대학(4년제)2",
                                     desiredLocation: "서울 강남구2",
                                     desiredJob: "베이커리, 카페, 편의점2",
                                     totalCareerDuration: "2년 1개월 16일2",
                                     careers: [Career(companyName: "롯데리아 기흥점",
                                                      startDate: "23.08".toDate(format: "yy.MM") ?? Date(),
                                                      endDate: "24.12".toDate(format: "yy.MM") ?? Date())
    ])]
}
