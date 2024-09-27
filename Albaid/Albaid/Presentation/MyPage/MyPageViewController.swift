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

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Configuration
    override func configureSubviews() {
    }

    // MARK: Layout
    override func makeConstraints() {
    }

    override func setNavigationItem() {
        setDefaultNavigationItem(title: "마이페이지", leftBarButton: nil, rightBarButton: notificationButton)
    }
}
