//
//  ResumeOptionModalViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/30/24.
//

import UIKit

final class ResumeOptionModalViewController: BaseViewController {

    // MARK: UI Components
    private let resumeOptionModalView = ResumeOptionModalView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        router.viewController = self
    }
    
    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(resumeOptionModalView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        resumeOptionModalView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: View Transition
    override func viewTransition() {
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
    }
}
