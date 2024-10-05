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
}
