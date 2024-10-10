//
//  ScanLoadingViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ScanLoadingViewController: BaseViewController {

    // MARK: UI Components
    private let scanLoadingView = ScanLoadingView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Properties

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: test
        let image = AlbaidImage.dummyContract2.pngData()!
        postContractUpload(contractImage: image)

        router.viewController = self
    }
    
    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(scanLoadingView)
    }

    // MARK: Layout
    override func makeConstraints() {
        scanLoadingView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        navigationItem.hidesBackButton = true
    }
}

extension ScanLoadingViewController {
    // MARK: Networking
    private func postContractUpload(contractImage: Data) {
        print("🔔 postContractUpload called")
        NetworkService.shared.contract.postContractUpload(contractImage: contractImage) {
            [self] result in
            switch result {
            case .success(let response):
                guard let data = response as? ContractUploadResponse else { return }
                print("🎯 postContractUpload success: " + "\(data)")
                scanSuccess(data: data.result)
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

    private func scanSuccess(data: ContractUpload) {
        router.presentScanResultViewController(data: data)
    }
}
