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
            getLogin(provider: "naver")
        }

        loginView.tapKakaoLogin = { [weak self] in
            guard let self else { return }
            getLogin(provider: "kakao")
        }
    }

    // MARK: Networking
    private func getLogin(provider: String) {
        print("🔔 getLogin called")
        NetworkService.shared.auth.getLogin(provider: provider) {
            [self] result in
            switch result {
            case .success(let response):
                guard let data = response as? AuthLoginResponse else { return }
                print("🎯 getLogin success: " + "\(data)")
                guard let url = URL(string: "\(data.result)") else { return }

                let naverLoginViewController = NaverLoginViewController(url: url)
                navigationController?.pushViewController(naverLoginViewController, animated: true)
            case .requestErr(let errorResponse):
                dump(errorResponse)
                guard let data = errorResponse as? ErrorResponse else { return }
                print(data)
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            case .pathErr:
                print("pathErr")
            }
        }
    }
}
