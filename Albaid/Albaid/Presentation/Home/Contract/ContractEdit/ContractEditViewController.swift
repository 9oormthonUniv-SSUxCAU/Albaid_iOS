//
//  ContractEditViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ContractEditViewController: BaseViewController {

    // MARK: UI Components
    private(set) var closeButton = BaseButton().then {
        $0.setTitle("닫기", for: .normal)
        $0.setTitleColor(.albaidGray30, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 20)
    }

    private(set) var confirmButton = BaseButton().then {
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.albaidGray30, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 20)
    }

    private let contractEditView = ContractEditView()

    // MARK: Properties
    private let id: Int
    private var contractDetail: ContractRequest?

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Init
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
        getContractId(contractId: id)
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
        view.addSubview(contractEditView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        contractEditView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        closeButton.tap = { [weak self] in
            guard let self else { return }
            router.dismissViewController()
        }

        confirmButton.tap = { [weak self] in
            guard let self else { return }
            router.dismissViewController()
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: "근로계약서" + "\(id)",
                                 leftBarButton: closeButton,
                                 rightBarButton: confirmButton)
        navigationItem.hidesBackButton = true
    }

    // MARK: Data binding
    private func setView(data: ContractRequest) {
        contractEditView.setData(data: data)
        contractEditView.scanResultTopContentView.setEditData(data: data)
        contractEditView.scanResultBottomContentView.setDetailData(data: data)
    }
}

// MARK: Networking
extension ContractEditViewController {
    private func getContractId(contractId: Int) {
        print("🔔 getContractId called - edit")
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
