//
//  HomeCardCollectionView.swift
//  Albaid
//
//  Created by 박지윤 on 9/28/24.
//

import UIKit

final class HomeCardCollectionView: BaseView {

    // MARK: UI Components
    private let cardCollectionView = UICollectionView()

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(cardCollectionView)

        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }

    // MARK: Layout
    override func makeConstraints() {
        cardCollectionView.snp.makeConstraints {
            $0.height.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }

    }
}
