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

    // MARK: Properties
    var contractList: [ContractList] = []

    // MARK: Init
    init(modal: Bool) {
        super.init(nibName: nil, bundle: nil)
        setNavigationItem(modal: modal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        getContract()
    }

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

        // TODO: fix
        addButton.tap = { [weak self] in
            guard let self else { return }
            router.presentContractAddModalViewController()
        }

        closeButton.tap = { [weak self] in
            guard let self else { return }
            router.dismissViewController()
        }

        contractView.contractCollectionView.tapCell = { [self] contractList in
            router.presentContractDetailViewController(contractList: contractList)
        }

        contractView.contractCollectionView.tapOption = { [self] contractList in
            router.presentModalViewController(contractList: contractList)
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
    private func setData(data: [ContractList]) {
        contractView.contractCollectionView.setData(data: data)
    }
}

// MARK: Networking
extension ContractViewController {
    private func getContract() {
        print("🔔 getContract called")
        NetworkService.shared.contract.getContract() {
            [self] result in
            switch result {
            case .success(let response):
                guard let data = response as? ContractListResponse else { return }
                print("🎯 getContract success: " + "\(data)")
                contractList = data.result
                setData(data: data.result)
            case .requestErr(let errorResponse):
                dump(errorResponse)
                guard let data = errorResponse as? ErrorResponse else { return }
                print(data)
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            case .pathErr:
                print("pathErr")
            }
        }
    }
}
