//
//  ScanCameraViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ScanCameraViewController: BaseViewController {

    // MARK: UI Components
    private(set) var closeButton = BaseButton().then {
        $0.setImage(AlbaidButton.close.withTintColor(.albaidGray30), for: .normal)
    }

    private let scanCameraView = ScanCameraView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
    }

    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(scanCameraView)
    }

    // MARK: Layout
    override func makeConstraints() {
        scanCameraView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        closeButton.tap = { [weak self] in
            guard let self else { return }
            router.popViewController()
        }

        scanCameraView.tapCamera = { [weak self] in
            guard let self else { return }
            router.presentScanLoadingViewController()
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: nil,
                                 leftBarButton: nil,
                                 rightBarButton: closeButton)
        navigationItem.hidesBackButton = true
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
}
