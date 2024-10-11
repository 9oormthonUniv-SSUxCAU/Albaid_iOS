//
//  ScanMemoViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ScanMemoViewController: BaseViewController {

    // MARK: UI Components
    private(set) var closeButton = BaseButton().then {
        $0.setImage(AlbaidButton.close.withTintColor(.albaidGray30), for: .normal)
    }

    private(set) var confirmButton = BaseButton().then {
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.albaidGray30, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 18)
    }

    private let scanMemoView = ScanMemoView()

    // MARK: Environment
    private let router = BaseRouter()
    private let contractImage: Data
    private var request: ContractInput

    // MARK: Init
    init(contractImage: Data, request: ContractInput) {
        self.contractImage = contractImage
        self.request = request
        super.init(nibName: nil, bundle: nil)
        setData(data: request)
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
        view.addSubview(scanMemoView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        scanMemoView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        closeButton.tap = { [weak self] in
            guard let self else { return }
            router.popViewController()
        }

        confirmButton.tap = { [weak self] in
            guard let self else { return }
            if scanMemoView.memoTextView.text == "메모를 입력하세요" {
                request.memo = ""
                postContract(contractImage: contractImage, request: request)
            } else {
                request.memo = scanMemoView.memoTextView.text
                postContract(contractImage: contractImage, request: request)
            }
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: nil,
                                 leftBarButton: closeButton,
                                 rightBarButton: confirmButton)
    }

    // MARK: Data Binding
    private func setData(data: ContractInput) {
        scanMemoView.setData(data: data)
    }
}

extension ScanMemoViewController {
    // MARK: Networking
    private func postContract(contractImage: Data, request: ContractInput) {
        print("🔔 postContract called - memo")
        NetworkService.shared.contract.postContract(contractImage: contractImage, request: request) {
            [self] result in
            switch result {
            case .success(let response):
                guard let data = response as? ContractRequestResponse else { return }
                print("🎯 postContract success: " + "\(data)")
                router.popToRootViewController()
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

