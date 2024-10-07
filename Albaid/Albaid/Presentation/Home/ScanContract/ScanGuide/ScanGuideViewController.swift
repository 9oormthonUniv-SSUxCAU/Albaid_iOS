//
//  ScanGuideViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ScanGuideViewController: BaseViewController {

    // MARK: UI Components
    private(set) var backButton = BaseButton().then {
        $0.setImage(AlbaidButton.back.withTintColor(.albaidGray30), for: .normal)
    }

    private(set) var closeButton = BaseButton().then {
        $0.setImage(AlbaidButton.close.withTintColor(.albaidGray30), for: .normal)
    }

    private let scanGuideView = ScanGuideView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Init
    init(modal: Bool) {
        super.init(nibName: nil, bundle: nil)
        setNavigationItem(modal: modal)
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
        view.addSubview(scanGuideView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        scanGuideView.snp.makeConstraints {
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
            router.dismissViewController()
        }

        scanGuideView.tapCamera = { [weak self] in
            guard let self else { return }
            router.presentScanCameraViewController()
        }
    }

    // MARK: Navigation Item
    func setNavigationItem(modal: Bool) {
        if !modal {
            setDefaultNavigationItem(title: nil, leftBarButton: backButton, rightBarButton: nil)
        } else {
            setDefaultNavigationItem(title: nil, leftBarButton: nil, rightBarButton: closeButton)
        }
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
}
