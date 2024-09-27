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
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
}
