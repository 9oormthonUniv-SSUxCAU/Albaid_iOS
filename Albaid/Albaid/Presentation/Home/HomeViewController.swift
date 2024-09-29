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

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setData(data: User.dummyUser)
        router.viewController = self
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

    // MARK: View Transition
    override func viewTransition() {
        homeView.homeMenuView.tapScan = { [weak self] in
            guard let self else { return }
            router.presentScanGuideViewController()
        }

        homeView.homeMenuView.tapContract = { [weak self] in
            guard let self else { return }
            router.presentContractViewController()
        }
    }

    // MARK: data binding
    private func setData(data: User) {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        let dateToString = dateFormatter.string(from: today)

        homeView.homeTodayView.dateLabel.text = dateToString
        homeView.homeTodayView.userLabel.text = data.name + "님 오늘도 파이팅!"

        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "M"
        monthFormatter.locale = Locale(identifier: "ko_KR")
        let monthToString = monthFormatter.string(from: today)

        homeView.homeCardCollectionView.setData(data: data)

        homeView.homeContentView.userLabel.text = data.name + "님을 위한 알바 내역"
        homeView.homeContentView.monthTotalWageTextLabel.text = monthToString + "월 월급 총계"

        guard let cards = data.card else {
            print("카드 정보가 없습니다.")
            return
        }

        let monthTotalWage = cards.reduce(0) { $0 + $1.monthWage }

        homeView.homeContentView.monthTotalWageLabel.text = monthTotalWage.toPriceFormat + "원"
    }
}
