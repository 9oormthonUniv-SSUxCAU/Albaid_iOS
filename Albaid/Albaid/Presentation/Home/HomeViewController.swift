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

        setUserData(data: User.dummyUser)
        setData(data: Contract.dummyContract)
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

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: nil, leftBarButton: nil, rightBarButton: notificationButton)
        navigationItem.title = nil
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoImageView)
    }

    // MARK: View Transition
    override func viewTransition() {
        notificationButton.tap = { [weak self] in
            guard let self else { return }
            router.presentNotificationViewController()
        }

        homeView.homeCardCollectionView.tapCell = { [self] id in
            router.presentCardDetailViewController(id: id)
        }

        homeView.homeMenuView.tapScan = { [weak self] in
            guard let self else { return }
            router.presentScanGuideViewController()
        }

        homeView.homeMenuView.tapContract = { [weak self] in
            guard let self else { return }
            router.presentContractViewController()
        }

        homeView.homeMenuView.tapResume = { [weak self] in
            guard let self else { return }
            router.presentResumeViewController()
        }
    }

    // MARK: Data binding
    private func setUserData(data: User) {
        homeView.homeTodayView.setData(data: data)
        homeView.homeContentView.setData(data: data)

        guard let cards = data.card else {
            print("카드 정보가 없습니다.")
            return
        }

        let monthTotalWage = cards.reduce(0) { $0 + $1.monthWage }

        homeView.homeContentView.monthTotalWageLabel.text = monthTotalWage.toPriceFormat + "원"
    }

    // MARK: Data binding
    private func setData(data: [Contract]) {
        homeView.homeCardCollectionView.setData(data: data)
    }
}
