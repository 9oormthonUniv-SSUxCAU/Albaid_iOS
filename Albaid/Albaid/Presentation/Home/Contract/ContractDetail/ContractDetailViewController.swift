//
//  ContractDetailViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ContractDetailViewController: BaseViewController {

    // MARK: UI Components
    private(set) var backButton = BaseButton().then {
        $0.setImage(AlbaidButton.back.withTintColor(.albaidGray30), for: .normal)
    }

    private(set) var optionButton = BaseButton().then {
        $0.setImage(AlbaidButton.menu.withTintColor(.albaidGray30), for: .normal)
    }

    private let contractDetailView = ContractDetailView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
    }
    
    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(contractDetailView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        contractDetailView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        backButton.tap = { [weak self] in
            guard let self else { return }
            router.popViewController()
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: "근로계약서1",
                                 leftBarButton: backButton,
                                 rightBarButton: optionButton)
    }
}
