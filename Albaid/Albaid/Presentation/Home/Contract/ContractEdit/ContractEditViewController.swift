//
//  ContractEditViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ContractEditViewController: BaseViewController {

    // MARK: UI Components
    private(set) var closeButton = BaseButton().then {
        $0.setTitle("닫기", for: .normal)
        $0.setTitleColor(.albaidGray30, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 16)
    }

    private(set) var confirmButton = BaseButton().then {
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.albaidGray30, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 18)
    }

    private let contractEditView = ContractEditView()

    // MARK: Properties
    private let contractList: ContractList
    private var contractDetail: ContractRequest?
    private var contractInput = ContractInput(title: "",
                                              workplace: "",
                                              contractStartDate: "",
                                              contractEndDate: nil,
                                              standardWorkingStartTime: "",
                                              standardWorkingEndTime: "",
                                              workingDays: [],
                                              hourlyWage: 0,
                                              jobDescription: "",
                                              isPaidAnnualLeave: false,
                                              isSocialInsurance: false,
                                              isContractDelivery: false,
                                              memo: "")

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Init
    init(contractList: ContractList) {
        self.contractList = contractList
        super.init(nibName: nil, bundle: nil)
        getContractId(contractId: contractList.id)
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
        closeButton.tap = { [weak self] in
            guard let self else { return }
            router.dismissViewController()
        }

        contractEditView.scanResultTopContentView.tapDayLabel = { [self] days in
            let dayModalViewController = DayModalViewController(data: days)
            dayModalViewController.modalPresentationStyle = .pageSheet
            if let sheet = dayModalViewController.sheetPresentationController {
                sheet.detents = [.custom(resolver: { _ in 170 })]
                sheet.preferredCornerRadius = 12
            }

            dayModalViewController.onDismiss = { [self] receivedData in
                if receivedData.isEmpty {
                    contractEditView.scanResultTopContentView.workingDayContentLabel.text = "요일을 선택해주세요"
                    contractEditView.scanResultTopContentView.workingDayContentLabel.textColor = .albaidGray60
                } else {
                    contractEditView.scanResultTopContentView.workingDayContentLabel.text = receivedData.joined(separator: " ")
                    contractEditView.scanResultTopContentView.workingDayContentLabel.textColor = .albaidGray20
                }
            }
            present(dayModalViewController, animated: true, completion: nil)
        }

        confirmButton.tap = { [weak self] in
            guard let self else { return }
            let view = contractEditView.scanResultTopContentView
            contractInput.title = view.workplaceTextField.text ?? ""
            contractInput.workplace = view.workplaceTextField.text ?? ""

            let startDate = view.contractStartDateTextField.text?.toDate(format: "yyyy-MM-dd")
            let startDateString = startDate?.toDateString(format: "yyyy-MM-dd")
            contractInput.contractStartDate = startDateString ?? ""

            let endDate = view.contractEndDateTextField.text?.toDate(format: "yyyy-MM-dd")
            let endDateString = endDate?.toDateString(format: "yyyy-MM-dd")
            contractInput.contractEndDate = endDateString ?? ""

            contractInput.standardWorkingStartTime = view.workingStartTimeTextField.text ?? ""
            contractInput.standardWorkingEndTime = view.workingEndTimeTextField.text ?? ""

            let workingDays = view.workingDayContentLabel.text
            let reverseDayMapping: [String: String] = [
                "월": "MO",
                "화": "TU",
                "수": "WE",
                "목": "TH",
                "금": "FR",
                "토": "SA",
                "일": "SU"
            ]

            let ENGDays = workingDays?.split(separator: " ").compactMap { reverseDayMapping[String($0)] }
            contractInput.workingDays = ENGDays ?? []

            let hourlyWage = view.hourlyWageTextField.text
            contractInput.hourlyWage = hourlyWage?.revertPriceFormat ?? 0
            contractInput.jobDescription = view.jobDescriptionTextField.text ?? ""

            contractInput.memo = contractEditView.memoTextField.text ?? ""

            putContractId(contractId: contractList.id, request: contractInput)
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: contractList.title,
                                 leftBarButton: closeButton,
                                 rightBarButton: confirmButton)
        navigationItem.hidesBackButton = true
    }

    // MARK: Data binding
    private func setView(data: ContractRequest) {
        contractEditView.setData(data: data)
        contractEditView.scanResultTopContentView.setEditData(data: data)
        contractEditView.scanResultBottomContentView.setDetailData(data: data)
    }

    private func convertDataType(data: ContractRequest) {
        contractInput.title = data.title
        contractInput.workplace = data.workplace
        contractInput.contractStartDate = data.contractStartDate
        contractInput.contractEndDate = data.contractEndDate
        contractInput.standardWorkingStartTime = data.standardWorkingStartTime
        contractInput.standardWorkingEndTime = data.standardWorkingEndTime
        contractInput.workingDays = data.workingDays
        contractInput.hourlyWage = data.hourlyWage
        contractInput.jobDescription = data.jobDescription
        contractInput.isPaidAnnualLeave = data.isPaidAnnualLeave
        contractInput.isSocialInsurance = data.isSocialInsurance
        contractInput.isContractDelivery = data.isContractDelivery
        contractInput.memo = data.memo
    }
}

// MARK: Networking
extension ContractEditViewController {
    private func getContractId(contractId: Int) {
        print("🔔 getContractId called - edit")
        NetworkService.shared.contract.getContractId(contractId: contractId) {
            [self] result in
            switch result {
            case .success(let response):
                guard let data = response as? ContractRequestResponse else { return }
                print("🎯 getContractId success: " + "\(data)")
                contractDetail = data.result
                setView(data: data.result)
                convertDataType(data: data.result)
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

    private func putContractId(contractId: Int, request: ContractInput) {
        print("🔔 putContractId called")
        print(contractId)
        print(request)
        NetworkService.shared.contract.putContractId(contractId: contractId, request: contractInput) {
            [self] result in
            switch result {
            case .success(let response):
                guard let data = response as? ContractRequestResponse else { return }
                print("🎯 putContractId success: " + "\(data)")
                router.dismissViewController()
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
