//
//  TabBarViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

class TabBarViewController: UITabBarController {

    // MARK: Constants
    private enum Metric {
        static let tabBarHeight: CGFloat = 90.0
        static let titleFontSize: CGFloat = 11.0
        static let imageTopInset: CGFloat = 0.0
        static let imageBottomInset: CGFloat = -4.0
        static let titleVerticalOffset: CGFloat = 3.0
    }

    // MARK: UI Components
    let homeViewController = HomeViewController()
    let calendarViewController = CalendarViewController()
    let cardViewController = CardViewController()
    let myPageViewController = MyPageViewController()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBarViewController()
        setupTabBarUI()
    }

    // MARK: viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        var tabFrame = tabBar.frame
        tabFrame.size.height = Metric.tabBarHeight
        tabFrame.origin.y = view.frame.size.height - Metric.tabBarHeight
        tabBar.frame = tabFrame
    }

    // MARK: TabBar
    private func setupTabBarViewController() {
        homeViewController.title = "홈"
        calendarViewController.title = "캘린더"
        cardViewController.title = "알바 카드"
        myPageViewController.title = "마이페이지"
        
        setupTabBarItem(for: homeViewController,
                        image: AlbaidButton.home.withRenderingMode(.alwaysOriginal),
                        selectedImage: AlbaidButton.homeFilled.withRenderingMode(.alwaysOriginal))
        setupTabBarItem(for: calendarViewController,
                        image: AlbaidButton.calendar.withRenderingMode(.alwaysOriginal),
                        selectedImage: AlbaidButton.calendarFilled.withRenderingMode(.alwaysOriginal))
        setupTabBarItem(for: cardViewController,
                        image: AlbaidButton.card.withRenderingMode(.alwaysOriginal),
                        selectedImage: AlbaidButton.cardFilled.withRenderingMode(.alwaysOriginal))
        setupTabBarItem(for: myPageViewController,
                        image: AlbaidButton.myPage.withRenderingMode(.alwaysOriginal),
                        selectedImage: AlbaidButton.myPageFilled.withRenderingMode(.alwaysOriginal))

        let navigationHome = UINavigationController(rootViewController: homeViewController)
        let navigationCalendar = UINavigationController(rootViewController: calendarViewController)
        let navigationCard = UINavigationController(rootViewController: cardViewController)
        let navigationMyPage = UINavigationController(rootViewController: myPageViewController)

        setViewControllers([navigationHome,
                            navigationCalendar,
                            navigationCard,
                            navigationMyPage], animated: false)
    }

    private func setupTabBarItem(for viewController: UIViewController, image: UIImage, selectedImage: UIImage) {
        let tabBarItem = UITabBarItem(title: viewController.title, image: image, selectedImage: selectedImage)

        tabBarItem.setTitleTextAttributes([
            .font: UIFont.systemFont(ofSize: Metric.titleFontSize),
            .foregroundColor: UIColor.gray70 ?? .gray
        ], for: .normal)
        
        tabBarItem.setTitleTextAttributes([
            .font: UIFont.systemFont(ofSize: Metric.titleFontSize),
            .foregroundColor: UIColor.gray20 ?? .black
        ], for: .selected)

        tabBarItem.imageInsets = UIEdgeInsets(top: Metric.imageTopInset, left: 0, bottom: Metric.imageBottomInset, right: 0)
        tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: Metric.titleVerticalOffset)
        viewController.tabBarItem = tabBarItem
    }

    private func setupTabBarUI() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .gray20
        tabBar.unselectedItemTintColor = .gray70

        tabBar.layer.borderColor = UIColor.black.withAlphaComponent(0.08).cgColor
        tabBar.layer.borderWidth = 1

        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.clipsToBounds = true
    }
}
