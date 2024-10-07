//
//  CardAddOptionModalViewController.swift
//  Albaid
//
//  Created by 박지윤 on 10/7/24.
//

import UIKit

final class CardAddOptionModalViewController: BaseViewController {

    // MARK: UI Components
    private let cardAddOptionModalView = CardAddOptionModalView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
    }

    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(cardAddOptionModalView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        cardAddOptionModalView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        cardAddOptionModalView.cameraOptionView.tapView = { [weak self] in
            guard let self else { return }
            router.presentScanGuideViewController2()
        }

        cardAddOptionModalView.contractOptionView.tapView = { [weak self] in
            guard let self else { return }
            router.presentContractViewController2()
        }

        cardAddOptionModalView.galleryOptionView.tapView = { [weak self] in
            guard let self else { return }
            router.presentGalleryViewController()
        }
    }
}
