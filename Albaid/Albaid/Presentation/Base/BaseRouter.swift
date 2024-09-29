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

    func popViewController() {
        viewController?.navigationController?.popViewController(animated: true)
    }

    func dismissViewController() {
//        viewController?.dismiss(animated: true)
        viewController?.navigationController?.dismiss(animated: true)
    }
}
