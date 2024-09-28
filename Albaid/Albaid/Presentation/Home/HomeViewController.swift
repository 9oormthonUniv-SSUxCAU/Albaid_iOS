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

    let homeView = HomeView()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setData()
    }

    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(homeView)
    }

    // MARK: Layout
    override func makeConstraints() {
        homeView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }

        logoImageView.snp.makeConstraints {
            $0.height.equalTo(24)
        }
    }

    override func setNavigationItem() {
        setDefaultNavigationItem(title: nil, leftBarButton: nil, rightBarButton: notificationButton)
        navigationItem.title = nil
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoImageView)
    }

    // MARK: data binding
    private func setData() {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        let dateToString = dateFormatter.string(from: today)
        homeView.homeTodayView.dateLabel.text = dateToString
        homeView.homeTodayView.userLabel.text = "김알바" + "님 오늘도 파이팅!"
    }
}
