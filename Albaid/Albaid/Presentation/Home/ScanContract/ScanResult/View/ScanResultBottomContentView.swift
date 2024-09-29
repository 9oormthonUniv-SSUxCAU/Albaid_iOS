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

    private(set) var vacationStackView = UIStackView().then {
        $0.contractIsSuccessStackView(title: "연차 유급휴가 내용", isSuccess: AlbaidImage.success)
    }

    private(set) var insuranceStackView = UIStackView().then {
        $0.contractIsSuccessStackView(title: "사회보험 적용", isSuccess: AlbaidImage.success)
    }

    private(set) var employmentStackView = UIStackView().then {
        $0.contractIsSuccessStackView(title: "근로계약서 교부", isSuccess: AlbaidImage.success)
    }

    // MARK: Properties

    // MARK: Configuration
    override func configureSubviews() {
        layer.cornerRadius = 12
        backgroundColor = .gray95

        addSubview(resultStackView)

        resultStackView.addArrangedSubviews(vacationStackView,
                                            insuranceStackView,
                                            employmentStackView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        resultStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.verticalEdges.equalToSuperview().inset(15)
        }
    }
}
