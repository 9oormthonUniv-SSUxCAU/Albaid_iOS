//
//  ResumeAddViewController.swift
//  Albaid
//
//  Created by 박지윤 on 10/7/24.
//

import UIKit

final class ResumeAddViewController: BaseViewController {

    // MARK: UI Components
    private(set) var backButton = BaseButton().then {
        $0.setImage(AlbaidButton.back.withTintColor(.albaidGray30), for: .normal)
    }

    private let closeButton = BaseButton().then {
        $0.setImage(AlbaidButton.close.withTintColor(.albaidGray30), for: .normal)
    }

    private let resumeAddView = ResumeAddView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
    }
    
    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(resumeAddView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        resumeAddView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        resumeAddView.tapClose = { [weak self] in
            guard let self else { return }
            router.dismissViewController()
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: "이력서",
                                 leftBarButton: backButton,
                                 rightBarButton: closeButton)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
}
