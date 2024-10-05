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

    private(set) var workPlaceStackView = UIStackView()
    private(set) var contractDateStackView = UIStackView()
    private(set) var workingTimeStackView = UIStackView()
    private(set) var workingDayStackView = UIStackView()
    private(set) var hourlyWageStackView = UIStackView()
    private(set) var workingStackView = UIStackView()

    // MARK: Properties

    // MARK: Configuration
    override func configureSubviews() {
        layer.cornerRadius = 12
        backgroundColor = .albaidGray95

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
