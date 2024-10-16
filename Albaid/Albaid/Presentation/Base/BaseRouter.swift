//
//  BaseRouter.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit
import SafariServices

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
        let scanGuideViewController = ScanGuideViewController(modal: false)
        scanGuideViewController.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(scanGuideViewController, animated: true)
    }

    func presentScanGuideViewController2() {
        let scanGuideViewController = ScanGuideViewController(modal: true)
        let navigationController = UINavigationController(rootViewController: scanGuideViewController)
        navigationController.modalPresentationStyle = .fullScreen
        viewController?.present(navigationController, animated: true, completion: nil)
    }

    func presentScanCameraViewController() {
        let scanCameraViewController = ScanCameraViewController()
        viewController?.navigationController?.pushViewController(scanCameraViewController, animated: true)
    }

    func presentScanCameraViewController2() {
        let scanCameraViewController = ScanCameraViewController()
        viewController?.navigationController?.pushViewController(scanCameraViewController, animated: true)
    }

    func presentScanLoadingViewController() {
        let scanLoadingViewController = ScanLoadingViewController()
        viewController?.navigationController?.pushViewController(scanLoadingViewController, animated: true)
    }

    func presentScanLoadingViewController2() {
        let scanLoadingViewController = ScanLoadingViewController()
        let navigationController = UINavigationController(rootViewController: scanLoadingViewController)
        navigationController.modalPresentationStyle = .fullScreen
        viewController?.present(navigationController, animated: true, completion: nil)
    }

    func presentScanResultViewController(data: ContractUpload) {
        let scanResultViewController = ScanResultViewController(data: data)
        viewController?.navigationController?.pushViewController(scanResultViewController, animated: true)
    }

    func presentScanCompleteViewController(contractImage: Data, request: ContractInput) {
        let scanCompleteViewController = ScanCompleteViewController(contractImage: contractImage, request: request)
        viewController?.navigationController?.pushViewController(scanCompleteViewController, animated: true)
    }

    func presentScanMemoViewController(contractImage: Data, request: ContractInput) {
        let scanMemoViewController = ScanMemoViewController(contractImage: contractImage, request: request)
        viewController?.navigationController?.pushViewController(scanMemoViewController, animated: true)
    }

    /// scanContract
    func presentContractViewController() {
        let contractViewController = ContractViewController(modal: false)
        viewController?.navigationController?.pushViewController(contractViewController, animated: true)
    }

    func presentContractViewController2() {
        let contractViewController = ContractViewController(modal: true)
        let navigationController = UINavigationController(rootViewController: contractViewController)
        navigationController.modalPresentationStyle = .fullScreen
        viewController?.present(navigationController, animated: true, completion: nil)
    }

    func presentContractDetailViewController(contractList: ContractList) {
        let contractDetailViewController = ContractDetailViewController(contractList: contractList)
        contractDetailViewController.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(contractDetailViewController, animated: true)
    }

    func presentContractEditViewController(contractList: ContractList) {
        let contractEditViewController = ContractEditViewController(contractList: contractList)
        let navigationController = UINavigationController(rootViewController: contractEditViewController)
        navigationController.modalPresentationStyle = .fullScreen
        viewController?.present(navigationController, animated: true, completion: nil)
    }

    func presentDeletePopUpViewController(id: Int) {
        let deletePopUpViewController = DeletePopUpViewController(id: id)
        deletePopUpViewController.modalPresentationStyle = .overFullScreen
        viewController?.present(deletePopUpViewController, animated: false)
    }

    func presentModalViewController(contractList: ContractList) {
        let optionModalViewController = OptionModalViewController(contractList: contractList)
        optionModalViewController.modalPresentationStyle = .pageSheet
        if let sheet = optionModalViewController.sheetPresentationController {
            sheet.detents = [.custom(resolver: { _ in 180 })]
            sheet.preferredCornerRadius = 12
        }
        viewController?.present(optionModalViewController, animated: true, completion: nil)
    }

    /// contract
    func presentContractAddModalViewController() {
        let contractAddModalViewController = ContractAddModalViewController()
        contractAddModalViewController.modalPresentationStyle = .pageSheet
        if let sheet = contractAddModalViewController.sheetPresentationController {
            sheet.detents = [.custom(resolver: { _ in 265 })]
            sheet.preferredCornerRadius = 12
        }
        viewController?.present(contractAddModalViewController, animated: true, completion: nil)
    }

    /// resume
    func presentResumeViewController() {
        let resumeViewController = ResumeViewController()
        viewController?.navigationController?.pushViewController(resumeViewController, animated: true)
    }

    func presentResumeAddViewController() {
        let resumeAddViewController = ResumeAddViewController()
        resumeAddViewController.modalPresentationStyle = .fullScreen
        viewController?.present(resumeAddViewController, animated: true, completion: nil)
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

    func presentResumeDetailViewController(id: Int) {
        let resumeDetailViewController = ResumeDetailViewController(id: id)
        viewController?.navigationController?.pushViewController(resumeDetailViewController, animated: true)
    }

    /// calendar
    func presentCalendarWeeklyViewController(month: Int) {
        let calendarWeeklyViewController = CalendarWeeklyViewController(month: month)
        viewController?.navigationController?.pushViewController(calendarWeeklyViewController, animated: true)
    }

    func presentCalendarDailyViewController() {
        let calendarDailyViewController = CalendarDailyViewController()
        viewController?.navigationController?.pushViewController(calendarDailyViewController, animated: true)
    }

    /// card
    func presentCardDetailViewController(id: Int) {
        let cardDetailViewController = CardDetailViewController(id: id)
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

    func presentCardAddOptionModalViewController() {
        let cardAddOptionModalViewController = CardAddOptionModalViewController()
        cardAddOptionModalViewController.modalPresentationStyle = .pageSheet
        if let sheet = cardAddOptionModalViewController.sheetPresentationController {
            sheet.detents = [.custom(resolver: { _ in 265 })]
            sheet.preferredCornerRadius = 12
        }
        viewController?.present(cardAddOptionModalViewController, animated: true, completion: nil)
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

    func presentSafariViewController(url: String) {
        guard let url = URL(string: url) else { return }
        let safariViewController = SFSafariViewController(url: url)
        viewController?.present(safariViewController, animated: true, completion: nil)
    }

    func presentGalleryViewController() {
        let galleryViewController = GalleryViewController()
        galleryViewController.modalPresentationStyle = .fullScreen
        viewController?.present(galleryViewController, animated: true)
    }

    func popViewController() {
        viewController?.navigationController?.popViewController(animated: true)
    }

    func popToRootViewController() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }

    func dismissViewController() {
        viewController?.dismiss(animated: true)
    }

    func dismissViewControllerWithoutAnimated() {
        viewController?.dismiss(animated: false)
    }
}
