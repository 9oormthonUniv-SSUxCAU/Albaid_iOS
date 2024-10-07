//
//  ContractAddModalViewController.swift
//  Albaid
//
//  Created by 박지윤 on 10/8/24.
//

import UIKit

final class ContractAddModalViewController: BaseViewController {

    // MARK: UI Components
    private let contractAddModalView = ContractAddModalView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
    }

    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(contractAddModalView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        contractAddModalView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        contractAddModalView.cameraOptionView.tapView = { [weak self] in
            guard let self else { return }
            router.presentScanGuideViewController2()
        }

        contractAddModalView.contractOptionView.tapView = { [weak self] in
            guard let self else { return }
            router.presentContractViewController2()
        }

        contractAddModalView.galleryOptionView.tapView = { [weak self] in
            guard let self else { return }
            router.presentGalleryViewController()
        }
    }
}

