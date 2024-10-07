//
//  ContractEditViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ContractEditViewController: BaseViewController {

    // MARK: UI Components
    private(set) var confirmButton = BaseButton().then {
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.albaidGray30, for: .normal)
    }

    private let contractEditView = ContractEditView()

    // MARK: Properties
    private let id: Int

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Init
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
        setView(data: Contract.dummyContract[id])
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
        view.addSubview(contractEditView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        contractEditView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        confirmButton.tap = { [weak self] in
            guard let self else { return }
            router.dismissViewController()
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: "근로계약서" + "\(id + 1)",
                                 leftBarButton: nil,
                                 rightBarButton: confirmButton)
        navigationItem.hidesBackButton = true
    }

    // MARK: Data binding
    private func setView(data: Contract) {
        contractEditView.setData(data: data)
        contractEditView.scanResultTopContentView.setData(data: data)
        contractEditView.scanResultBottomContentView.setData(data: data)
    }
}
