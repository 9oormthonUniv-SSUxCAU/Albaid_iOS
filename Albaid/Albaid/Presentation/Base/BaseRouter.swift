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

    /// card
    func presentCardDetailViewController() {
        let cardDetailViewController = CardDetailViewController()
        cardDetailViewController.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(cardDetailViewController, animated: true)
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

    func popViewController() {
        viewController?.navigationController?.popViewController(animated: true)
    }

    func dismissViewController() {
        viewController?.navigationController?.dismiss(animated: true)
    }
}
