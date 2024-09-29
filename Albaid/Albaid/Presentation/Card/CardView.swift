//
//  CardView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class CardView: BaseView {

    // MARK: UI Components
    private let cardCollectionView = CardCollectionView()

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(cardCollectionView)
    }

    // MARK: Layout
    override func makeConstraints() {
        cardCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
