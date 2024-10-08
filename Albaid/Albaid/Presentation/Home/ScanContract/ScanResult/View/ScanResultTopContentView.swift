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

    private(set) var workplaceStackView = UIStackView()
    private(set) var contractDateStackView = UIStackView()
    private(set) var workingTimeStackView = UIStackView()

    private(set) var workingDayStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fill
    }
    private(set) var dayTitleLabel = UILabel().then {
        $0.setContractTitleLabel(title: "근무 일자")
    }
    private(set) var emptyView = UIView()
    private(set) var dayContentLabel = UILabel().then {
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        $0.isUserInteractionEnabled = true
    }

    private(set) var hourlyWageStackView = UIStackView()
    private(set) var jobDescriptionStackView = UIStackView()

    // MARK: Properties
    var tapLabel: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        setDayModal()

        layer.cornerRadius = 12
        backgroundColor = .albaidGray95

        addSubview(resultStackView)

        resultStackView.addArrangedSubviews(workplaceStackView,
                                            contractDateStackView,
                                            workingTimeStackView,
                                            workingDayStackView,
                                            hourlyWageStackView,
                                            jobDescriptionStackView)

        workingDayStackView.addArrangedSubviews(dayTitleLabel, emptyView, dayContentLabel)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        resultStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
    }

    private func setDayModal() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dayLabelTapped))
        dayContentLabel.addGestureRecognizer(tapGesture)
    }

    @objc func dayLabelTapped() {
        tapLabel?()
    }

    // MARK: Data binding
    func setData(data: Contract) {
//        workplaceStackView.contractLabelStackView(title: "근무지", content: data.workplace)
//
//        var workingDaysText = data.contractStartDate.toDateString(format: "yyyy.MM.dd") + "~"
//        if data.contractEndDate != nil {
//            workingDaysText = data.contractStartDate.toDateString(format: "yyyy.MM.dd") + "~" + (data.contractEndDate?.toDateString(format: "yyyy.MM.dd") ?? "")
//        }
//
//        contractDateStackView.contractLabelStackView(title: "계약기간", content: workingDaysText)
//
//        let timeDifferenceInSeconds = data.standardWorkingEndTime.timeIntervalSince(data.standardWorkingStartTime)
//        let hours = Int(timeDifferenceInSeconds) / 3600
//        let minutes = (Int(timeDifferenceInSeconds) % 3600) / 60
//        let workingTimeText = data.standardWorkingStartTime.toTimeString() + "~" + data.standardWorkingEndTime.toTimeString()
//        var workingTotal = ""
//
//        if hours != 0 && minutes != 0 {
//            workingTotal = "\(hours)시간 \(minutes)분"
//        } else if minutes == 0 {
//            workingTotal = "\(hours)시간"
//        } else {
//            workingTotal = "\(minutes)분"
//        }
//
//        workingTimeStackView.contractLabelStackView(title: "소정근로시간", content: workingTimeText + " (\(workingTotal))")
//
//        let days = data.workingDays.joined(separator: " ")
//        workingDayStackView.contractLabelStackView(title: "근무 일자", content: days)
//        hourlyWageStackView.contractLabelStackView(title: "시급", content: data.hourlyWage.toPriceFormat + "원")
//        jobDescriptionStackView.contractLabelStackView(title: "업무 내용", content: data.jobDescription)
    }
}
