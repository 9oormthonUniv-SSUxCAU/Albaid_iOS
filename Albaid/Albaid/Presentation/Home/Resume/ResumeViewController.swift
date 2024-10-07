//
//  ResumeViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ResumeViewController: BaseViewController {

    // MARK: UI Components
    private(set) var backButton = BaseButton().then {
        $0.setImage(AlbaidButton.back.withTintColor(.albaidGray30), for: .normal)
    }

    private let addButton = BaseButton().then {
        $0.setImage(AlbaidButton.add, for: .normal)
    }

    private let resumeView = ResumeView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setData(data: Resume.dummyResume)
        router.viewController = self
    }
    
    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(resumeView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        resumeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        backButton.tap = { [weak self] in
            guard let self else { return }
            router.popViewController()
        }

        addButton.tap = { [weak self] in
            guard let self else { return }
            router.presentResumeAddViewController()
        }

        resumeView.tapCell = { [self] id in
            router.presentResumeDetailViewController(id: id)
        }

        resumeView.tapOption = { [weak self] in
            guard let self else { return }
            router.presentResumeOptionModalViewController()
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: "이력서",
                                 leftBarButton: backButton,
                                 rightBarButton: addButton)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    // MARK: Data binding
    private func setData(data: [Resume]) {
        resumeView.setViewData(data: data)
    }
}
