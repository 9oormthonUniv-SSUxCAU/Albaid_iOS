//
//  ScanResultViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ScanResultViewController: BaseViewController {

    // MARK: UI Components
    private(set) var backButton = BaseButton().then {
        $0.setImage(AlbaidButton.back.withTintColor(.gray30 ?? .black), for: .normal)
    }

    private(set) var closeButton = BaseButton().then {
        $0.setImage(AlbaidButton.close.withTintColor(.gray30 ?? .black), for: .normal)
    }

    private let scanResultView = ScanResultView()

    // MARK: Environment
    private let router = BaseRouter()

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
        backButton.tap = { [weak self] in
            guard let self else { return }
            router.popViewController()
        }

        closeButton.tap = { [weak self] in
            guard let self else { return }
            router.popViewController()
        }

//        scanGuideView.tapCamera = { [weak self] in
//            guard let self else { return }
//            router.presentScanResultViewController()
//        }
    }

    override func setNavigationItem() {
        setDefaultNavigationItem(title: nil, leftBarButton: backButton, rightBarButton: closeButton)
    }
}
