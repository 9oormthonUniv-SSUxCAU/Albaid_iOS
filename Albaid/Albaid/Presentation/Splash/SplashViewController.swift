//
//  SplashViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

class SplashViewController: BaseViewController {

    // MARK: UI Components
    private let splashView = SplashView()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate

//            if UserDefaultHandler.loginStatus == true {
//                sceneDelegate?.changeRootViewToTabBarViewController()
//            } else {
                sceneDelegate?.changeRootViewController()
//            }
        }
    }

    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(splashView)
    }

    // MARK: Layout
    override func makeConstraints() {
        splashView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
