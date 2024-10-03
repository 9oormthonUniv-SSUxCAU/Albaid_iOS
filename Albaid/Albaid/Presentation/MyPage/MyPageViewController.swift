//
//  MyPageViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

class MyPageViewController: BaseViewController {

    // MARK: UI Components
    private let notificationButton = BaseButton().then {
        $0.setImage(AlbaidButton.bell, for: .normal)
    }

    private let myPageView = MyPageView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
    }

    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(myPageView)
    }

    // MARK: Layout
    override func makeConstraints() {
        myPageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: "마이페이지", leftBarButton: nil, rightBarButton: notificationButton)
    }

    // MARK: View Transition
    override func viewTransition() {
        notificationButton.tap = { [weak self] in
            guard let self else { return }
            router.presentNotificationViewController()
        }

//        myPageView.tapCell = { [weak self] in
//            guard let self else { return }
//            router.presentModalViewController()
////            router.presentMyPageContentViewController(section: section, row: row)
//        }
    }
}
