//
//  DummyData.swift
//  Albaid
//
//  Created by 박지윤 on 9/28/24.
//

import Foundation

extension User {
    static let dummyUser = User(name: "김알바",
                                card: [Card.dummyCard1,
                                       Card.dummyCard2,
                                       Card.dummyCard3])
}

extension Card {
    static let dummyCard1 = Card(index: 1, workPlace: "투썸 플레이스 광교점", monthWage: 2108000)
    static let dummyCard2 = Card(index: 2, workPlace: "투썸 플레이스 숭실대점", monthWage: 45400)
    static let dummyCard3 = Card(index: 3, workPlace: "투썸 플레이스 중앙대점", monthWage: 768000)
}
