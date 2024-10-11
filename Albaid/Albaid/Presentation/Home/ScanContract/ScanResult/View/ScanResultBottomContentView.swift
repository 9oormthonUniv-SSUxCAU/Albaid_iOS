//
//  ScanResultBottomContentView.swift
//  Albaid
//
//  Created by 박지윤 on 9/29/24.
//

import UIKit

final class ScanResultBottomContentView: BaseView {
    
    // MARK: UI Components
    private(set) var resultStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
    }

    private(set) var isPaidAnnualLeaveStackView = UIStackView()
    private(set) var isSocialInsuranceStackView = UIStackView()
    private(set) var isContractDeliveryStackView = UIStackView()

    // MARK: Properties

    // MARK: Configuration
    override func configureSubviews() {
        layer.cornerRadius = 12
        backgroundColor = .albaidGray95

        addSubview(resultStackView)

        resultStackView.addArrangedSubviews(isPaidAnnualLeaveStackView,
                                            isSocialInsuranceStackView,
                                            isContractDeliveryStackView)
    }

    // MARK: Layout
    override func makeConstraints() {
        resultStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.verticalEdges.equalToSuperview().inset(15)
        }
    }

    // MARK: Data binding
    func setData(data: ContractUpload) {
        isPaidAnnualLeaveStackView.contractIsSuccessStackView(title: "연차 유급휴가 내용", isSuccess: data.isPaidAnnualLeave ? AlbaidImage.success : AlbaidImage.failure)
        isSocialInsuranceStackView.contractIsSuccessStackView(title: "사회보험 적용", isSuccess: data.isSocialInsurance ? AlbaidImage.success : AlbaidImage.failure)
        isContractDeliveryStackView.contractIsSuccessStackView(title: "근로계약서 교부", isSuccess: data.isContractDelivery ? AlbaidImage.success : AlbaidImage.failure)
    }

    func setDetailData(data: ContractRequest) {
        isPaidAnnualLeaveStackView.contractIsSuccessStackView(title: "연차 유급휴가 내용", isSuccess: data.isPaidAnnualLeave ? AlbaidImage.success : AlbaidImage.failure)
        isSocialInsuranceStackView.contractIsSuccessStackView(title: "사회보험 적용", isSuccess: data.isSocialInsurance ? AlbaidImage.success : AlbaidImage.failure)
        isContractDeliveryStackView.contractIsSuccessStackView(title: "근로계약서 교부", isSuccess: data.isContractDelivery ? AlbaidImage.success : AlbaidImage.failure)
    }
}
