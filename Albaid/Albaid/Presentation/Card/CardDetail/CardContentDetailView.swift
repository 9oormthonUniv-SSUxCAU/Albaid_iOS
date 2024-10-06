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

    private(set) var workPlaceStackView = UIStackView()
    private(set) var contractDateStackView = UIStackView()
    private(set) var workingTimeStackView = UIStackView()
    private(set) var workingDayStackView = UIStackView()
    private(set) var hourlyWageStackView = UIStackView()
    private(set) var jobDescriptionStackView = UIStackView()

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
                                            jobDescriptionStackView)

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

    // MARK: Data
    func setData(data: Contract) {
        workPlaceStackView.contractLabelStackView(title: "근무지", content: data.workplace)

        var workingDaysText = data.contractStartDate.toDateString() + "~"
        if data.contractEndDate != nil {
            workingDaysText = data.contractStartDate.toDateString() + "~" + (data.contractEndDate?.toDateString() ?? "")
        }

        contractDateStackView.contractLabelStackView(title: "계약기간", content: workingDaysText)

        let timeDifferenceInSeconds = data.standardWorkingEndTime.timeIntervalSince(data.standardWorkingStartTime)
        let hours = Int(timeDifferenceInSeconds) / 3600
        let minutes = (Int(timeDifferenceInSeconds) % 3600) / 60
        let workingTimeText = data.standardWorkingStartTime.toTimeString() + "~" + data.standardWorkingEndTime.toTimeString()
        var workingTotal = ""

        if hours != 0 && minutes != 0 {
            workingTotal = "\(hours)" + "시간 " + "\(minutes)" + "분"
        } else if minutes == 0 {
            workingTotal = "\(hours)" + "시간"
        } else {
            workingTotal = "\(minutes)" + "분"
        }

        workingTimeStackView.contractLabelStackView(title: "소정근로시간", content: workingTimeText + " (" + workingTotal + ")")

        let days = data.workingDays.joined(separator: " ")
        workingDayStackView.contractLabelStackView(title: "근무 일자", content: days)
        hourlyWageStackView.contractLabelStackView(title: "시급", content: data.hourlyWage.toPriceFormat + "원")
        jobDescriptionStackView.contractLabelStackView(title: "업무 내용", content: data.jobDescription)

        setMonthData(data: data)
        setTotalData(data: data)
    }

    private func setMonthData(data: Contract) {
    }

    private func setTotalData(data: Contract) {
    }
}
