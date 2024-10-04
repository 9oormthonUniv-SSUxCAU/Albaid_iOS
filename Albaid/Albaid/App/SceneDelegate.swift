//
//  SceneDelegate.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: Properties
    var window: UIWindow?
    let dependency: AppDependency

    // MARK: Initializer
    override init() {
        self.dependency = CompositionRoot.resolve()
        super.init()
    }

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = dependency.windowCreator(windowScene)
        window?.makeKeyAndVisible()
    }

    func changeRootViewController() {
        guard let window = window else { return }
        if Storage.isFirstTime() {
            window.rootViewController = UINavigationController(rootViewController:
                                                                OnboardingViewController(progressBar: AlbaidImage.progress1,
                                                                                         title: AlbaidString.onboardingTitle1,
                                                                                         content: AlbaidString.onboardingContent1,
                                                                                         image: AlbaidImage.onboarding1,
                                                                                         skipHidden: false,
                                                                                         nextButton: "다음"))
        } else {
            window.rootViewController = UINavigationController(rootViewController: LoginViewController())
        }
        UIView.transition(with: window, duration: 0.2, options: [.transitionCrossDissolve], animations: nil)
     }

    func changeRootViewToTabBarViewController() {
        guard let window = window else { return }
        window.rootViewController = TabBarViewController()
        UIView.transition(with: window, duration: 0.1, options: [.transitionCrossDissolve], animations: nil)
    }
}
