//
//  ScanMemoViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ScanMemoViewController: BaseViewController {

    // MARK: UI Components

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
    }
    
    // MARK: Configuration
    override func configureSubviews() {
    }
    
    // MARK: Layout
    override func makeConstraints() {
    }

    // MARK: View Transition
    override func viewTransition() {
    }
}
