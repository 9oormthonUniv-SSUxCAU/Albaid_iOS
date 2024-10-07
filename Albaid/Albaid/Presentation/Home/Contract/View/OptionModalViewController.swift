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

    // MARK: Properties
    let id: Int

    // MARK: Init
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
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
        optionModalView.tapEdit = { [weak self] in
            guard let self else { return }
            print("eeee")
            router.presentContractEditViewController(id: id)
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
    }
}
