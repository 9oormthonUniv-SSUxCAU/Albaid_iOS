//
//  CardGuideOptionModalViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/30/24.
//

import UIKit

final class CardGuideOptionModalViewController: BaseViewController {

    // MARK: UI Components
    private let cardGuideOptionModalView = CardGuideOptionModalView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
    }

    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(cardGuideOptionModalView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        cardGuideOptionModalView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        cardGuideOptionModalView.tapConfirm = { [weak self] in
            guard let self else { return }
            router.dismissViewController()
        }
    }
}
