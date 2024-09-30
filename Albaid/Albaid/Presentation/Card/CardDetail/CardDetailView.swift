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

    private(set) var nonScrollView = UIView()

    private(set) var addResumeButton = BaseButton().then {
        $0.setTextButton(title: "이력서에 추가하기",
                         titleColor: .albaidGray100,
                         backgroundColor: .albaidGray20)
    }

    // MARK: Configuration
    override func configureSubviews() {
        scrollView.backgroundColor = .albaidGreen10

        addSubview(scrollView)
        scrollView.addSubview(entireView)

        entireView.addSubview(cardCharacterImageView)
        entireView.addSubview(cardContentView)

        addSubview(nonScrollView)
        nonScrollView.addSubview(addResumeButton)
    }

    // MARK: Layout
    override func makeConstraints() {
        scrollView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(121)
        }

        entireView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }

        cardCharacterImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(111)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(226)
        }

        cardContentView.snp.makeConstraints {
            $0.top.equalTo(cardCharacterImageView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }

        nonScrollView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.bottom)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }

        addResumeButton.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(56)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
}
