//
//  ScanCompleteViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ScanCompleteViewController: BaseViewController {

    // MARK: UI Components
    private let scanCompleteView = ScanCompleteView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
    }
    
    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(scanCompleteView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        scanCompleteView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        scanCompleteView.tapConfirm = { [weak self] in
            guard let self else { return }
            router.popToRootViewController()
        }

        scanCompleteView.tapMemo = { [weak self] in
            guard let self else { return }
            router.presentScanMemoViewController()
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: nil,
                                 leftBarButton: nil,
                                 rightBarButton: nil)
        navigationItem.hidesBackButton = true
    }
}
