//
//  CardDetailOptionModalViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/30/24.
//

import UIKit

final class CardDetailOptionModalViewController: BaseViewController {

    // MARK: UI Components
    private let cardDetailOptionModalView = CardDetailOptionModalView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
    }
    
    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(cardDetailOptionModalView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        cardDetailOptionModalView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

