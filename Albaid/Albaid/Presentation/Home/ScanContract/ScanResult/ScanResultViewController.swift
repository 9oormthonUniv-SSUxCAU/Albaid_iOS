//
//  ScanResultViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ScanResultViewController: BaseViewController {

    // MARK: UI Components
    private(set) var closeButton = BaseButton().then {
        $0.setImage(AlbaidButton.close.withTintColor(.albaidGray30), for: .normal)
    }

    private let scanResultView = ScanResultView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Properties
    var data: ContractUpload
    var onModalDismiss: (([String]) -> Void)?
    var selectedDays: [String] = []

    // MARK: Init
    init(data: ContractUpload) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
        setView(data: data)
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
        view.addSubview(scanResultView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        scanResultView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        closeButton.tap = { [weak self] in
            guard let self else { return }
            router.popToRootViewController()
        }

        scanResultView.tapReScan = { [weak self] in
            guard let self else { return }
            router.presentScanCameraViewController2()
        }

        scanResultView.tapRegister = { [self] contractInput in
            let image = AlbaidImage.dummyContract.pngData()!
            print("🛟\n\(contractInput)")
            postContract(contractImage: image, request: contractInput)
        }

        scanResultView.tapDangerDetail = { [weak self] in
            guard let self else { return }
            router.presentSafariViewController(url: AlbaidString.dangerDetail)
        }

        scanResultView.scanResultTopContentView.tapDayLabel = { [self] days in
            let dayModalViewController = DayModalViewController(data: days)
            dayModalViewController.modalPresentationStyle = .pageSheet
            if let sheet = dayModalViewController.sheetPresentationController {
                sheet.detents = [.custom(resolver: { _ in 170 })]
                sheet.preferredCornerRadius = 12
            }

            dayModalViewController.onDismiss = { [self] receivedData in
                if receivedData.isEmpty {
                    scanResultView.scanResultTopContentView.workingDayContentLabel.text = "요일을 선택해주세요"
                    scanResultView.scanResultTopContentView.workingDayContentLabel.textColor = .albaidGray60
                } else {
                    scanResultView.scanResultTopContentView.workingDayContentLabel.text = receivedData.joined(separator: " ")
                    scanResultView.scanResultTopContentView.workingDayContentLabel.textColor = .albaidGray20
                }
            }
            present(dayModalViewController, animated: true, completion: nil)
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: nil,
                                 leftBarButton: nil,
                                 rightBarButton: closeButton)
        navigationItem.hidesBackButton = true
    }

    // MARK: Data binding
    private func setView(data: ContractUpload) {
        scanResultView.setData(data: data)
        scanResultView.scanResultTopContentView.setData(data: data)
        scanResultView.scanResultBottomContentView.setData(data: data)
    }
}

extension ScanResultViewController {
    // MARK: Networking
    private func postContract(contractImage: Data, request: ContractInput) {
        print("🔔 postContract called")
        NetworkService.shared.contract.postContract(contractImage: contractImage, request: request) {
            [self] result in
            switch result {
            case .success(let response):
                guard let data = response as? ContractRequestResponse else { return }
                print("🎯 postContract success: " + "\(data)")
                router.presentScanCompleteViewController(contractImage: contractImage, request: request)
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
