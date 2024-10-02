//
//  CardContentDetailView.swift
//  Albaid
//
//  Created by 박지윤 on 9/30/24.
//

import UIKit

final class CardContentDetailView: BaseView {

    // MARK: UI Components
    private(set) var resultStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
    }

    private(set) var workPlaceStackView = UIStackView().then {
        $0.contractLabelStackView(title: "근무지", content: "투썸 플레이스 광교점")
    }

    private(set) var contractDateStackView = UIStackView().then {
        $0.contractLabelStackView(title: "계약기간", content: "2024.09.22~12.22")
    }

    private(set) var workingTimeStackView = UIStackView().then {
        $0.contractLabelStackView(title: "소정근로시간", content: "10:00 ~ 14:00 (4시간)")
    }

    private(set) var workingDayStackView = UIStackView().then {
        $0.contractLabelStackView(title: "근무 일자", content: "월 화 수")
    }

    private(set) var hourlyWageStackView = UIStackView().then {
        $0.contractLabelStackView(title: "시급", content: "9,860원")
    }

    private(set) var workingStackView = UIStackView().then {
        $0.contractLabelStackView(title: "업무 내용", content: "평일 미들 스텝")
    }

    private(set) var dividerView1 = DividerView(dividerType: .thin)

    private(set) var monthStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
    }

    private(set) var monthTimeStackView = UIStackView().then {
        $0.contractLabelStackView(title: "이번 달 일한 시간", content: "48시간")
    }

    private(set) var monthWageStackView = UIStackView().then {
        $0.contractLabelStackView(title: "이번 달 알바비", content: "473,280원")
    }

    private(set) var dividerView2 = DividerView(dividerType: .thin)

    private(set) var totalStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
    }

    private(set) var totalDayStackView = UIStackView().then {
        $0.contractLabelStackView(title: "총 일한 시간", content: "89시간")
    }

    private(set) var totalTimeStackView = UIStackView().then {
        $0.contractLabelStackView(title: "총 출근 일수", content: "24일")
    }

    private(set) var totalWageStackView = UIStackView().then {
        $0.contractLabelStackView(title: "총 월급", content: "2,108,000원")
    }

    // MARK: Properties

    // MARK: Configuration
    override func configureSubviews() {
        layer.cornerRadius = 12
        backgroundColor = .albaidGray95

        addSubview(resultStackView)
        addSubview(dividerView1)
        addSubview(monthStackView)
        addSubview(dividerView2)
        addSubview(totalStackView)

        resultStackView.addArrangedSubviews(workPlaceStackView,
                                            contractDateStackView,
                                            workingTimeStackView,
                                            workingDayStackView,
                                            hourlyWageStackView,
                                            workingStackView)

        monthStackView.addArrangedSubviews(monthTimeStackView,
                                            monthWageStackView)

        totalStackView.addArrangedSubviews(totalDayStackView,
                                            totalTimeStackView,
                                            totalWageStackView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        resultStackView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(219)
        }

        dividerView1.snp.makeConstraints {
            $0.top.equalTo(resultStackView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        monthStackView.snp.makeConstraints {
            $0.top.equalTo(dividerView1.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(63)
        }

        dividerView2.snp.makeConstraints {
            $0.top.equalTo(monthStackView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        totalStackView.snp.makeConstraints {
            $0.top.equalTo(dividerView2.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(102)
        }
    }
}
