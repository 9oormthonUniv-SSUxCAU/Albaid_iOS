//
//  User.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import Foundation

struct User {
    let name: String
    let card: [Card]?
}

struct Card {
    let index: Int
    let workPlace: String
    let monthWage: Int
}
