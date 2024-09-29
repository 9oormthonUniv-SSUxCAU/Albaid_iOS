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

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

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

    // MARK: View Transition
    override func viewTransition() {
        postScan()
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        navigationItem.hidesBackButton = true
    }

    private func postScan() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [self] in
            router.presentScanResultViewController()
        }
    }
}
