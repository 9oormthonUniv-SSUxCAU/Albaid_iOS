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

        setData(data: Contract.dummyContract)
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
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: "알바 카드", leftBarButton: nil, rightBarButton: nil)
    }

    // MARK: View Transition
    override func viewTransition() {
        cardView.cardCollectionView.tapCell = { [self] id in
            router.presentCardDetailViewController(id: id)
        }

        cardView.cardCollectionView.tapAddCell = { [weak self] in
            guard let self else { return }
            router.presentCardAddOptionModalViewController()
        }

        cardView.cardCollectionView.tapGuide = { [weak self] in
            guard let self else { return }
            router.presentCardGuideOptionModalViewController()
        }
    }

    // MARK: Data
    private func setData(data: [Contract]) {
        cardView.cardCollectionView.setData(data: data)
    }
}
