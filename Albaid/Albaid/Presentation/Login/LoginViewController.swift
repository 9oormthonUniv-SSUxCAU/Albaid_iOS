//
//  LoginViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class LoginViewController: BaseViewController {

    // MARK: UI Components
    private let loginView = LoginView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
    }
    
    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(loginView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        loginView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        loginView.tapNaverLogin = { [weak self] in
            guard let self else { return }
            router.presentTabBarViewController()
        }
    }
}
