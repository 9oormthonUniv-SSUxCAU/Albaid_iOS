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

    // MARK: Properties
    private let contractList: ContractList
    private var contractDetail: ContractRequest?

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Init
    init(contractList: ContractList) {
        self.contractList = contractList
        super.init(nibName: nil, bundle: nil)
        getContractId(contractId: contractList.id)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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

        optionButton.tap = { [weak self] in
            guard let self else { return }
            router.presentModalViewController(contractList: contractList)
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: contractList.title,
                                 leftBarButton: backButton,
                                 rightBarButton: optionButton)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    // MARK: Data binding
    private func setView(data: ContractRequest) {
        contractDetailView.setData(data: data)
        contractDetailView.scanResultTopContentView.setDetailData(data: data)
        contractDetailView.scanResultBottomContentView.setDetailData(data: data)
    }
}

// MARK: Networking
extension ContractDetailViewController {
    private func getContractId(contractId: Int) {
        print("🔔 getContractId called")
        print(contractId)
        NetworkService.shared.contract.getContractId(contractId: contractId) {
            [self] result in
            switch result {
            case .success(let response):
                guard let data = response as? ContractRequestResponse else { return }
                print("🎯 getContractId success: " + "\(data)")
                contractDetail = data.result
                setView(data: data.result)
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
