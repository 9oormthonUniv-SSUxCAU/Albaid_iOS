//
//  CardDetailView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class CardDetailView: BaseView {

    // MARK: UI Components
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }

    private(set) var entireView = UIView()

    private(set) var cardCharacterImageView = UIImageView().then {
        $0.image = AlbaidImage.cardCharacter
        $0.contentMode = .scaleAspectFit
    }

    private(set) var cardContentView = CardContentView()

    // MARK: Properties
    var tapAddResume: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        scrollView.backgroundColor = .albaidGreen10

        addSubview(scrollView)
        scrollView.addSubview(entireView)

        entireView.addSubview(cardCharacterImageView)
        entireView.addSubview(cardContentView)
    }

    // MARK: Layout
    override func makeConstraints() {
        scrollView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }

        entireView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }

        cardCharacterImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(226)
        }

        cardContentView.snp.makeConstraints {
            $0.top.equalTo(cardCharacterImageView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
