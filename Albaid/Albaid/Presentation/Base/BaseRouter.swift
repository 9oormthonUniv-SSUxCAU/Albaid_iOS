//
//  BaseRouter.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class BaseRouter {
    // MARK: Properties
    weak var viewController: UIViewController?
    
    // MARK: Routing
    func presentOnboardingViewController(index: Int) {
        switch index {
        case 1:
            let onboardingViewController = OnboardingViewController(progressBar: AlbaidImage.progress2,
                                                                    title: AlbaidString.onboardingTitle2,
                                                                    content: AlbaidString.onboardingContent2,
                                                                    image: AlbaidImage.onboarding2,
                                                                    skipHidden: false,
                                                                    nextButton: "다음")
            viewController?.navigationController?.pushViewController(onboardingViewController, animated: true)
        case 2:
            let onboardingViewController = OnboardingViewController(progressBar: AlbaidImage.progress3,
                                                                    title: AlbaidString.onboardingTitle3,
                                                                    content: AlbaidString.onboardingContent3,
                                                                    image: AlbaidImage.onboarding3,
                                                                    skipHidden: true,
                                                                    nextButton: "시작하기")
            viewController?.navigationController?.pushViewController(onboardingViewController, animated: true)
        case 3:
            let loginViewController = LoginViewController()
            viewController?.navigationController?.pushViewController(loginViewController, animated: true)
        default:
            break
        }
    }

    func presentLoginViewController() {
        let loginViewController = LoginViewController()
        viewController?.navigationController?.pushViewController(loginViewController, animated: true)
    }

    func presentTabBarViewController() {
        let tabBarViewController = TabBarViewController()
        viewController?.navigationController?.pushViewController(tabBarViewController, animated: true)

        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        sceneDelegate?.changeRootViewToTabBarViewController()
    }

    /// scanContract
    func presentScanGuideViewController() {
        let scanGuideViewController = ScanGuideViewController()
        scanGuideViewController.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(scanGuideViewController, animated: true)
    }

    func presentScanCameraViewController() {
        let scanCameraViewController = ScanCameraViewController()
        viewController?.navigationController?.pushViewController(scanCameraViewController, animated: true)
    }

    func presentScanLoadingViewController() {
        let scanLoadingViewController = ScanLoadingViewController()
        viewController?.navigationController?.pushViewController(scanLoadingViewController, animated: true)
    }

    func presentScanResultViewController() {
        let scanResultViewController = ScanResultViewController()
        viewController?.navigationController?.pushViewController(scanResultViewController, animated: true)
    }

    func presentScanCompleteViewController() {
        let scanCompleteViewController = ScanCompleteViewController()
        viewController?.navigationController?.pushViewController(scanCompleteViewController, animated: true)
    }

    func presentScanMemoViewController() {
        let scanMemoViewController = ScanMemoViewController()
        viewController?.navigationController?.pushViewController(scanMemoViewController, animated: true)
    }

    /// scanContract
    func presentContractViewController() {
        let contractViewController = ContractViewController()
        viewController?.navigationController?.pushViewController(contractViewController, animated: true)
    }

    func presentContractDetailViewController() {
        let contractDetailViewController = ContractDetailViewController()
        contractDetailViewController.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(contractDetailViewController, animated: true)
    }

    func presentModalViewController() {
        let optionModalViewController = OptionModalViewController()
        optionModalViewController.modalPresentationStyle = .pageSheet
        if let sheet = optionModalViewController.sheetPresentationController {
            sheet.detents = [.custom(resolver: { _ in 180 })]
            sheet.preferredCornerRadius = 12
        }
        viewController?.present(optionModalViewController, animated: true, completion: nil)
    }

    /// resume
    func presentResumeViewController() {
        let resumeViewController = ResumeViewController()
        viewController?.navigationController?.pushViewController(resumeViewController, animated: true)
    }

    func presentResumeOptionModalViewController() {
        let resumeOptionModalViewController = ResumeOptionModalViewController()
        resumeOptionModalViewController.modalPresentationStyle = .pageSheet
        if let sheet = resumeOptionModalViewController.sheetPresentationController {
            sheet.detents = [.custom(resolver: { _ in 220 })]
            sheet.preferredCornerRadius = 12
        }
        viewController?.present(resumeOptionModalViewController, animated: true, completion: nil)
    }

    func presentResumeDetailViewController() {
        let resumeDetailViewController = ResumeDetailViewController()
        viewController?.navigationController?.pushViewController(resumeDetailViewController, animated: true)
    }

    /// calendar
    func presentCalendarWeeklyViewController() {
        let calendarWeeklyViewController = CalendarWeeklyViewController()
        viewController?.navigationController?.pushViewController(calendarWeeklyViewController, animated: true)
    }

    func presentCalendarDailyViewController() {
        let calendarDailyViewController = CalendarDailyViewController()
        viewController?.navigationController?.pushViewController(calendarDailyViewController, animated: true)
    }

    /// card
    func presentCardDetailViewController() {
        let cardDetailViewController = CardDetailViewController()
        cardDetailViewController.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(cardDetailViewController, animated: true)
    }

    func presentCardGuideOptionModalViewController() {
        let cardGuideOptionModalViewController = CardGuideOptionModalViewController()
        cardGuideOptionModalViewController.modalPresentationStyle = .pageSheet
        if let sheet = cardGuideOptionModalViewController.sheetPresentationController {
            sheet.detents = [.custom(resolver: { _ in 190 })]
            sheet.preferredCornerRadius = 12
        }
        viewController?.present(cardGuideOptionModalViewController, animated: true, completion: nil)
    }

    func presentCardDetailOptionModalViewController() {
        let cardDetailOptionModalViewController = CardDetailOptionModalViewController()
        cardDetailOptionModalViewController.modalPresentationStyle = .pageSheet
        if let sheet = cardDetailOptionModalViewController.sheetPresentationController {
            sheet.detents = [.custom(resolver: { _ in 220 })]
            sheet.preferredCornerRadius = 12
        }
        viewController?.present(cardDetailOptionModalViewController, animated: true, completion: nil)
    }

    /// myPage
    func presentNotificationViewController() {
        let notificationViewController = NotificationViewController()
        notificationViewController.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(notificationViewController, animated: true)
    }

    func presentMyPageContentViewController(section: Int, row: Int) {
        let totalWageViewController = TotalWageViewController()
        viewController?.navigationController?.pushViewController(totalWageViewController, animated: true)
    }

    func presentNotificationDetailViewController() {
        let notificationDetailViewController = NotificationDetailViewController()
        viewController?.navigationController?.pushViewController(notificationDetailViewController, animated: true)
    }

    func popViewController() {
        viewController?.navigationController?.popViewController(animated: true)
    }

    func dismissViewController() {
        viewController?.dismiss(animated: true)
    }
}
