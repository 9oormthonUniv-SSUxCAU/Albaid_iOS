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

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
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

        cardView.cardCollectionView.tapCell = { [weak self] in
            guard let self else { return }
            router.presentCardDetailViewController()
        }
    }

    override func setNavigationItem() {
        setDefaultNavigationItem(title: "알바 카드", leftBarButton: nil, rightBarButton: nil)
    }
}
