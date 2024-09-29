//
//  CardViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

class CardViewController: BaseViewController {

    // MARK: UI Components
    private let cardView = CardView()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(cardView)
    }

    // MARK: Layout
    override func makeConstraints() {
        cardView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    override func setNavigationItem() {
        setDefaultNavigationItem(title: "알바 카드", leftBarButton: nil, rightBarButton: nil)
    }
}
