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

    private(set) var addButton = BaseButton().then {
        $0.setImage(AlbaidButton.add.withTintColor(.albaidGray30), for: .normal)
    }

    private(set) var closeButton = BaseButton().then {
        $0.setImage(AlbaidButton.close.withTintColor(.albaidGray30), for: .normal)
    }

    private let contractView = ContractView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Init
    init(modal: Bool) {
        super.init(nibName: nil, bundle: nil)
        setNavigationItem(modal: modal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setData(data: Contract.dummyContract)
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

        // TODO: fix
        addButton.tap = { [weak self] in
            guard let self else { return }
            router.presentContractAddModalViewController()
        }

        closeButton.tap = { [weak self] in
            guard let self else { return }
            router.dismissViewController()
        }

        contractView.contractCollectionView.tapCell = { [self] id in
            router.presentContractDetailViewController(id: id)
        }

        contractView.contractCollectionView.tapOption = { [self] id in
            router.presentModalViewController(id: id)
        }
    }

    // MARK: Navigation Item
    func setNavigationItem(modal: Bool) {
        if !modal {
            setDefaultNavigationItem(title: "내 근로계약서",
                                     leftBarButton: backButton,
                                     rightBarButton: nil)
        } else {
            setDefaultNavigationItem(title: "내 근로계약서",
                                     leftBarButton: nil,
                                     rightBarButton: closeButton)
        }
    }

    // MARK: Data binding
    private func setData(data: [Contract]) {
        contractView.contractCollectionView.setData(data: data)
    }
}
