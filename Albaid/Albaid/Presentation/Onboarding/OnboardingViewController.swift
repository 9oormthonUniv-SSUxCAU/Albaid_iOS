//
//  OnboardingViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

class OnboardingViewController: BaseViewController {

    // MARK: UI Components
    private let onboardingView = OnboardingView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Init
    init(progressBar: UIImage,
         title: String,
         content: String,
         image: UIImage,
         skipHidden: Bool,
         nextButton: String) {
        super.init(nibName: nil, bundle: nil)
        setView(progressBar: progressBar,
                title: title,
                content: content,
                image: image,
                skipHidden: skipHidden,
                nextButton: nextButton)
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
        view.addSubview(onboardingView)
    }

    // MARK: Layout
    override func makeConstraints() {
        onboardingView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // MARK: View Transition
    override func viewTransition() {
        onboardingView.tapSkip = { [weak self] in
            guard let self else { return }
            router.presentLoginViewController()
        }

        onboardingView.tapNext = { [self] index in
            router.presentOnboardingViewController(index: index)
        }
    }

    private func setView(progressBar: UIImage,
                         title: String,
                         content: String,
                         image: UIImage,
                         skipHidden: Bool,
                         nextButton: String) {
        onboardingView.progressImageView.image = progressBar
        onboardingView.titleLabel.text = title
        onboardingView.contentLabel.text = content
        onboardingView.characterImageView.image = image
        onboardingView.skipButton.isHidden = skipHidden
        onboardingView.nextButton.setTitle(nextButton, for: .normal)
    }
}
