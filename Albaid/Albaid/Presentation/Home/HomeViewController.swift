//
//  HomeViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

class HomeViewController: BaseViewController {

    // MARK: UI Components
    private let logoImageView = UIImageView().then {
        $0.image = AlbaidImage.logo
        $0.contentMode = .scaleAspectFit
    }

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
        logoImageView.snp.makeConstraints {
            $0.height.equalTo(24)
        }
    }

    override func setNavigationItem() {
        setDefaultNavigationItem(title: nil, leftBarButton: nil, rightBarButton: notificationButton)
        navigationItem.title = nil
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoImageView)
    }
}
