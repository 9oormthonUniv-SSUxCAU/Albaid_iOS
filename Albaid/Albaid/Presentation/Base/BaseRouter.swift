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
}
