//
//  ResumeDetailViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ResumeDetailViewController: BaseViewController {

    // MARK: UI Components
    private(set) var backButton = BaseButton().then {
        $0.setImage(AlbaidButton.back.withTintColor(.albaidGray30), for: .normal)
    }

    private(set) var optionButton = BaseButton().then {
        $0.setImage(AlbaidButton.menu.withTintColor(.albaidGray30), for: .normal)
    }

    private let resumeDetailView = ResumeDetailView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Init
    init(id: Int) {
        super.init(nibName: nil, bundle: nil)
        setView(data: Resume.dummyResume[id])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
    }
    
    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(resumeDetailView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        resumeDetailView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        backButton.tap = { [weak self] in
            guard let self else { return }
            router.popViewController()
        }

        optionButton.tap = { [weak self] in
            guard let self else { return }
            router.presentResumeOptionModalViewController()
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: "내 이력서",
                                 leftBarButton: backButton,
                                 rightBarButton: optionButton)
    }

    // MARK: Data binding
    private func setView(data: Resume) {
        resumeDetailView.setViewData(data: data)
        resumeDetailView.careerListStackView.setViewData(data: data)
        resumeDetailView.setCareerListStackView()
    }
}
