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
    let contractList: ContractList

    // MARK: Init
    init(contractList: ContractList) {
        self.contractList = contractList
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
            router.presentContractEditViewController(contractList: contractList)
        }

//        optionModalView.tapDelete = { [weak self] in
//            guard let self else { return }
//            router.presentDeletePopUpViewController(id: contractList)
//        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
    }

    func dismissView() {
        dismiss(animated: true)
    }
}
