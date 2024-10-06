//
//  ScanResultViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ScanResultViewController: BaseViewController {

    // MARK: UI Components
    private(set) var backButton = BaseButton().then {
        $0.setImage(AlbaidButton.back.withTintColor(.albaidGray30), for: .normal)
    }

    private(set) var closeButton = BaseButton().then {
        $0.setImage(AlbaidButton.close.withTintColor(.albaidGray30), for: .normal)
    }

    private let scanResultView = ScanResultView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Init
    init(data: ContractInput) {
        super.init(nibName: nil, bundle: nil)
        setView(data: data)
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
        view.addSubview(scanResultView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        scanResultView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        backButton.tap = { [weak self] in
            guard let self else { return }
            router.popViewController()
        }

        closeButton.tap = { [weak self] in
            guard let self else { return }
            router.dismissViewController()
        }

        scanResultView.tapRegister = { [weak self] in
            guard let self else { return }
            router.presentScanCompleteViewController()
        }

        scanResultView.tapDangerDetail = { [weak self] in
            guard let self else { return }
            router.presentSafariViewController(url: AlbaidString.dangerDetail)
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: nil,
                                 leftBarButton: backButton,
                                 rightBarButton: closeButton)
    }

    private func setView(data: ContractInput) {
        let topView = scanResultView.scanResultTopContentView

        if data.workplace != nil {
            topView.workplaceStackView.contractStackView(title: "근무지", content: data.workplace ?? "nil")
        } else {
            topView.workplaceStackView.contractInputStackView(title: "근무지", content: "텍스트를 입력해주세요")
        }

        if data.contractStartDate != nil && data.contractEndDate != nil {
            topView.contractDateStackView.contractStackView(title: "계약기간", content: (data.contractStartDate ?? "nil") + "~" + (data.contractEndDate ?? "nil"))
        } else {
            topView.contractDateStackView.contractInputStackView(title: "계약기간", content: "날짜를 입력해주세요")
        }

        if data.standardWorkingStartTime != nil && data.standardWorkingEndTime != nil {
            topView.workingTimeStackView.contractStackView(title: "소정근로시간", content: (data.standardWorkingStartTime ?? "nil") + "~" + (data.standardWorkingEndTime ?? "nil"))
        } else {
            topView.workingTimeStackView.contractInputStackView(title: "소정근로시간", content: "시간을 입력해주세요")
        }

        if data.workingDays != nil {
            let days = data.workingDays?.joined(separator: " ")

            topView.workingDayStackView.contractStackView(title: "근무 일자", content: days ?? "nil")
        } else {
            topView.workingDayStackView.contractInputStackView(title: "근무 일자", content: "요일을 선택해주세요")
        }

        if data.hourlyWage != nil {
            topView.hourlyWageStackView.contractStackView(title: "시급", content: "\(data.hourlyWage ?? 0)")
        } else {
            topView.hourlyWageStackView.contractInputStackView(title: "시급", content: "텍스트를 입력해주세요")
        }

        if data.jobDescription != nil {
            topView.jobDescriptionStackView.contractStackView(title: "업무 내용", content: data.jobDescription ?? "nil")
        } else {
            topView.jobDescriptionStackView.contractInputStackView(title: "업무 내용", content: "텍스트를 입력해주세요")
        }

        let bottomView = scanResultView.scanResultBottomContentView

        if data.isPaidAnnualLeave ?? false {
            bottomView.isPaidAnnualLeaveStackView.contractIsSuccessStackView(title: "연차 유급휴가 내용", isSuccess: AlbaidImage.success)
        } else {
            bottomView.isPaidAnnualLeaveStackView.contractIsSuccessStackView(title: "연차 유급휴가 내용", isSuccess: AlbaidImage.failure)
        }

        if data.isSocialInsurance ?? false {
            bottomView.isSocialInsuranceStackView.contractIsSuccessStackView(title: "사회보험 적용", isSuccess: AlbaidImage.success)
        } else {
            bottomView.isSocialInsuranceStackView.contractIsSuccessStackView(title: "사회보험 적용", isSuccess: AlbaidImage.failure)
        }

        if data.isContractDelivery ?? false {
            bottomView.isContractDeliveryStackView.contractIsSuccessStackView(title: "근로계약서 교부", isSuccess: AlbaidImage.success)
        } else {
            bottomView.isContractDeliveryStackView.contractIsSuccessStackView(title: "근로계약서 교부", isSuccess: AlbaidImage.failure)
        }

        setToolTip(isPaidAnnualLeave: data.isPaidAnnualLeave ?? false,
                   isSocialInsurance: data.isSocialInsurance ?? false,
                   isContractDelivery: data.isContractDelivery ?? false)
    }

    private func setToolTip(isPaidAnnualLeave: Bool,
                            isSocialInsurance: Bool,
                            isContractDelivery: Bool) {
        if isPaidAnnualLeave && isSocialInsurance && isContractDelivery {
            scanResultView.scanResultTipView.backgroundColor = .albaidLightGreen
            scanResultView.scanResultTipView.snp.makeConstraints {
                $0.height.equalTo(76)
            }
            scanResultView.safetyImageView.image = AlbaidImage.safety
            scanResultView.safetyLabel.text = AlbaidString.safety
            scanResultView.safetyLabel.textColor = .albaidSafetyGreen
        } else {
            scanResultView.scanResultTipView.backgroundColor = .albaidLightRed
            scanResultView.scanResultTipView.snp.makeConstraints {
                $0.height.equalTo(57)
            }
            scanResultView.safetyImageView.snp.makeConstraints {
                $0.centerY.equalToSuperview()
            }
            scanResultView.scanResultTipView.addSubview(scanResultView.dangerDetailButton)
            scanResultView.dangerDetailButton.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.trailing.equalToSuperview().inset(16)
                $0.height.equalTo(29)
                $0.width.equalTo(72)
            }
            scanResultView.safetyImageView.image = AlbaidImage.danger
            scanResultView.safetyLabel.text = AlbaidString.danger
            scanResultView.safetyLabel.textColor = .albaidSafetyRed
        }
    }

    // MARK: Data binding
    private func setData(data: Contract) {
        scanResultView.scanResultTopContentView.setData(data: data)
    }
}
