//
//  DeletePopUpViewController.swift
//  Albaid
//
//  Created by 박지윤 on 10/8/24.
//

import UIKit

final class DeletePopUpViewController: BaseViewController {

    // MARK: UI Components
    private let deletePopUpView = DeletePopUpView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Properties
    let id: Int

    // MARK: Init
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .clear
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

        view.addSubview(deletePopUpView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        deletePopUpView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        deletePopUpView.tapCancel = { [weak self] in
            guard let self else { return }
            router.dismissViewControllerWithoutAnimated()
        }

        deletePopUpView.tapDelete = { [weak self] in
            guard let self else { return }
            deleteContractId(contractId: id)
        }
    }
}

extension DeletePopUpViewController {
    // MARK: Networking
    private func deleteContractId(contractId: Int) {
        print("🔔 deleteContractId called")
        NetworkService.shared.contract.deleteContractId(contractId: contractId) {
            [self] result in
            switch result {
            case .success(let response):
                guard let data = response as? ContractDeleteResponse else { return }
                print("🎯 deleteContractId success: " + "\(data)")
                router.dismissViewControllerWithoutAnimated()
            case .requestErr(let errorResponse):
                dump(errorResponse)
                guard let data = errorResponse as? ErrorResponse else { return }
                print(data)
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            case .pathErr:
                print("pathErr")
            }
        }
    }

}
