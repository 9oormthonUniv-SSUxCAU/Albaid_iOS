//
//  NotificationDetailViewController.swift
//  Albaid
//
//  Created by 박지윤 on 10/3/24.
//

import UIKit

class NotificationDetailViewController: BaseViewController {

    // MARK: UI Components
    private(set) var backButton = BaseButton().then {
        $0.setImage(AlbaidButton.back.withTintColor(.albaidGray30), for: .normal)
    }

    private let notificationDetailView = NotificationDetailView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
    }

    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(notificationDetailView)
    }

    // MARK: Layout
    override func makeConstraints() {
        notificationDetailView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.horizontalEdges.equalToSuperview()
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: "알림", leftBarButton: backButton, rightBarButton: nil)
    }

    // MARK: View Transition
    override func viewTransition() {
        backButton.tap = { [weak self] in
            guard let self else { return }
            router.popViewController()
        }
    }
}

