//
//  ContractViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ContractViewController: BaseViewController {

    // MARK: UI Components
    private(set) var backButton = BaseButton().then {
        $0.setImage(AlbaidButton.back.withTintColor(.albaidGray30), for: .normal)
    }

    private let contractView = ContractView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
    }
    
    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(contractView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        contractView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        backButton.tap = { [weak self] in
            guard let self else { return }
            router.popViewController()
        }

        contractView.contractCollectionView.tapCell = { [weak self] in
            guard let self else { return }
            router.presentContractDetailViewController()
        }

        contractView.contractCollectionView.tapOption = { [weak self] in
            guard let self else { return }
            router.presentModalViewController()
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: "내 근로계약서",
                                 leftBarButton: backButton,
                                 rightBarButton: nil)
    }
}
