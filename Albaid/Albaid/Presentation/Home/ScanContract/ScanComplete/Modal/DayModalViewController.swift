//
//  DayModalViewController.swift
//  Albaid
//
//  Created by 박지윤 on 10/8/24.
//

import UIKit

final class DayModalViewController: BaseViewController {

    // MARK: UI Components
    private let dayModalView = DayModalView()
    private var selectedDays: [String] = []

    // MARK: Properties
    var onDismiss: (([String]) -> Void)?

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Init
    init(data: ContractInput) {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setData()
        router.viewController = self
    }

    override func viewWillDisappear(_ animated: Bool) {
        onDismiss?(selectedDays)
    }

    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(dayModalView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        dayModalView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: Data binding
    private func setData() {
        dayModalView.onDismiss = { [self] data in
            selectedDays = data
        }
    }
}
