//
//  ScanResultTopContentView.swift
//  Albaid
//
//  Created by 박지윤 on 9/29/24.
//

import UIKit

final class ScanResultTopContentView: BaseView {
    
    // MARK: UI Components
    private(set) var resultStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
    }

    private(set) var workPlaceStackView = UIStackView().then {
        $0.contractLabelStackView(title: "근무지", content: "텍스트를 입력해주세요")
    }

    private(set) var contractDateStackView = UIStackView().then {
        $0.contractButtonStackView(title: "계약기간", content: "날짜를 입력해주세요")
    }

    private(set) var workingTimeStackView = UIStackView().then {
        $0.contractButtonStackView(title: "소정근로시간", content: "시간을 입력해주세요")
    }

    private(set) var workingDayStackView = UIStackView().then {
        $0.contractButtonStackView(title: "근무 일자", content: "요일을 선택해주세요")
    }

    private(set) var hourlyWageStackView = UIStackView().then {
        $0.contractButtonStackView(title: "시급", content: "텍스트를 입력해주세요")
    }

    private(set) var workingStackView = UIStackView().then {
        $0.contractLabelStackView(title: "업무 내용", content: "텍스트를 입력해주세요")
    }

    // MARK: Properties

    // MARK: Configuration
    override func configureSubviews() {
        layer.cornerRadius = 12
        backgroundColor = .gray95

        addSubview(resultStackView)

        resultStackView.addArrangedSubviews(workPlaceStackView,
                                            contractDateStackView,
                                            workingTimeStackView,
                                            workingDayStackView,
                                            hourlyWageStackView,
                                            workingStackView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        resultStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
    }
}
