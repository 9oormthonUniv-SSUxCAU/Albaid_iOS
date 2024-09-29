//
//  OptionModalViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/29/24.
//

import UIKit

final class OptionModalViewController: BaseViewController {

    // MARK: UI Components
    private let optionModalView = OptionModalView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        router.viewController = self
    }
    
    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(optionModalView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        optionModalView.snp.makeConstraints {
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
