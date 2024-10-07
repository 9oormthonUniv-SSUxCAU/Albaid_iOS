//
//  NotificationViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

class NotificationViewController: BaseViewController {

    // MARK: UI Components
    private(set) var backButton = BaseButton().then {
        $0.setImage(AlbaidButton.back.withTintColor(.albaidGray30), for: .normal)
    }

    private let notificationView = NotificationView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
    }

    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(notificationView)
    }

    // MARK: Layout
    override func makeConstraints() {
        notificationView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: "알림", leftBarButton: backButton, rightBarButton: nil)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    // MARK: View Transition
    override func viewTransition() {
        backButton.tap = { [weak self] in
            guard let self else { return }
            router.popViewController()
        }

        notificationView.tapCell = { [weak self] in
            guard let self else { return }
            router.presentNotificationDetailViewController()
        }
    }
}
