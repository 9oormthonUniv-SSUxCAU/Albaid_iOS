//
//  ScanResultTopContentView.swift
//  Albaid
//
//  Created by 박지윤 on 9/29/24.
//

import UIKit

final class ScanResultTopContentView: BaseView {
    
    // MARK: UI Components
    private(set) var startDatePicker = UIDatePicker().then {
        $0.datePickerMode = .date
        $0.preferredDatePickerStyle = .inline
        $0.locale = Locale(identifier: "ko-KR")
    }

    private(set) var endDatePicker = UIDatePicker().then {
        $0.datePickerMode = .date
        $0.preferredDatePickerStyle = .inline
        $0.locale = Locale(identifier: "ko-KR")
    }

    private(set) var startTimePicker = UIDatePicker().then {
        $0.datePickerMode = .time
        $0.preferredDatePickerStyle = .wheels
        $0.locale = Locale(identifier: "ko-KR")
    }

    private(set) var endTimePicker = UIDatePicker().then {
        $0.datePickerMode = .time
        $0.preferredDatePickerStyle = .wheels
        $0.locale = Locale(identifier: "ko-KR")
    }

    private(set) var resultStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
    }

    /// workplace
    private(set) var workplaceStackView = UIStackView().then {
        $0.contractDefaultStackView()
    }
    private(set) var workplaceLabel = UILabel().then {
        $0.setContractTitleLabel(title: "근무지")
    }
    private(set) var workplaceEmptyView = UIView()
    private(set) var workplaceTextField = UITextField().then {
        $0.setContractPlaceholder(content: "텍스트를 입력해주세요")
    }

    /// workplace
//    private(set) var occupationStackView = UIStackView().then {
//        $0.contractDefaultStackView()
//    }
//    private(set) var occupationLabel = UILabel().then {
//        $0.setContractTitleLabel(title: "업직종")
//    }
//    private(set) var occupationEmptyView = UIView()
//    private(set) var occupationTextField = UITextField().then {
//        $0.setContractPlaceholder(content: "텍스트를 입력해주세요")
//    }

    /// contractDate
    private(set) var contractDateStackView = UIStackView().then {
        $0.contractDefaultStackView()
    }
    private(set) var contractDateLabel = UILabel().then {
        $0.setContractTitleLabel(title: "계약 기간")
    }
    private(set) var contractDateEmptyView = UIView()
    private(set) var contractDateContentStackView = UIStackView().then {
        $0.contractDefaultStackView()
        $0.spacing = 4
    }
    private(set) var contractStartDateTextField = UITextField().then {
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        $0.setContractPlaceholder(content: "시작 날짜")
    }
    private(set) var contractDateDurationLabel = UILabel().then {
        $0.setContractContentLabel(content: "~")
    }
    private(set) var contractEndDateTextField = UITextField().then {
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        $0.setContractPlaceholder(content: "종료 날짜")
    }

    /// workingTime
    private(set) var workingTimeStackView = UIStackView().then {
        $0.contractDefaultStackView()
    }
    private(set) var workingTimeLabel = UILabel().then {
        $0.setContractTitleLabel(title: "소정근로시간")
    }
    private(set) var workingTimeEmptyView = UIView()

    private(set) var workingTimeContentStackView = UIStackView().then {
        $0.contractDefaultStackView()
        $0.spacing = 4
    }
    private(set) var workingStartTimeTextField = UITextField().then {
        $0.textColor = .albaidGray20
        $0.textAlignment = .center
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        $0.setContractPlaceholder(content: "시작 시간")
    }
    private(set) var workingTimeDurationLabel = UILabel().then {
        $0.setContractContentLabel(content: "~")
    }
    private(set) var workingEndTimeTextField = UITextField().then {
        $0.textColor = .albaidGray20
        $0.textAlignment = .center
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        $0.setContractPlaceholder(content: "종료 시간")
    }


    /// workingDay
    private(set) var workingDayStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fill
    }
    private(set) var workingDayLabel = UILabel().then {
        $0.setContractTitleLabel(title: "근무 일자")
    }
    private(set) var workingDayEmptyView = UIView()
    private(set) var workingDayContentLabel = UILabel().then {
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        $0.isUserInteractionEnabled = true
    }

    /// hourlyWage
    private(set) var hourlyWageStackView = UIStackView().then {
        $0.contractDefaultStackView()
    }
    private(set) var hourlyWageLabel = UILabel().then {
        $0.setContractTitleLabel(title: "시급")
    }
    private(set) var hourlyWageEmptyView = UIView()
    private(set) var hourlyWageTextField = UITextField().then {
        $0.setContractPlaceholder(content: "텍스트를 입력해주세요")
        $0.keyboardType = .numberPad
    }

    /// jobDescription
    private(set) var jobDescriptionStackView = UIStackView().then {
        $0.contractDefaultStackView()
    }
    private(set) var jobDescriptionLabel = UILabel().then {
        $0.setContractTitleLabel(title: "업무 내용")
    }
    private(set) var jobDescriptionEmptyView = UIView()
    private(set) var jobDescriptionTextField = UITextField().then {
        $0.setContractPlaceholder(content: "텍스트를 입력해주세요")
    }

    // MARK: Properties
    var tapDayLabel: (([String]) -> Void)?
    let dayMapping: [String: String] = [
        "MO": "월",
        "TU": "화",
        "WE": "수",
        "TH": "목",
        "FR": "금",
        "SA": "토",
        "SU": "일"
    ]

    let reverseDayMapping: [String: String] = [
        "월": "MO",
        "화": "TU",
        "수": "WE",
        "목": "TH",
        "금": "FR",
        "토": "SA",
        "일": "SU"
    ]

    // MARK: Configuration
    override func configureSubviews() {
        setUpDatePicker()
        setUpStartDateToolBar()
        setUpEndDateToolBar()
        setUpStartTimeToolBar()
        setUpEndTimeToolBar()

        setDayModal()
        setTextFieldDelegate()

        layer.cornerRadius = 12
        backgroundColor = .albaidGray95

        addSubview(resultStackView)

        resultStackView.addArrangedSubviews(workplaceStackView,
//                                            occupationStackView,
                                            contractDateStackView,
                                            workingTimeStackView,
                                            workingDayStackView,
                                            hourlyWageStackView,
                                            jobDescriptionStackView)

        workplaceStackView.addArrangedSubviews(workplaceLabel,
                                               workplaceEmptyView,
                                               workplaceTextField)

//        occupationStackView.addArrangedSubviews(occupationLabel,
//                                                occupationEmptyView,
//                                                occupationTextField)

        contractDateStackView.addArrangedSubviews(contractDateLabel,
                                                  contractDateEmptyView,
                                                  contractDateContentStackView)
        contractDateContentStackView.addArrangedSubviews(contractStartDateTextField,
                                                         contractDateDurationLabel,
                                                         contractEndDateTextField)

        workingTimeStackView.addArrangedSubviews(workingTimeLabel,
                                                 workingTimeEmptyView,
                                                 workingTimeContentStackView)
        workingTimeContentStackView.addArrangedSubviews(workingStartTimeTextField,
                                                        workingTimeDurationLabel,
                                                        workingEndTimeTextField)

        workingDayStackView.addArrangedSubviews(workingDayLabel,
                                                workingDayEmptyView,
                                                workingDayContentLabel)

        hourlyWageStackView.addArrangedSubviews(hourlyWageLabel,
                                                hourlyWageEmptyView,
                                                hourlyWageTextField)

        jobDescriptionStackView.addArrangedSubviews(jobDescriptionLabel,
                                                    jobDescriptionEmptyView,
                                                    jobDescriptionTextField)
    }

    // MARK: Layout
    override func makeConstraints() {
        resultStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
    }

    private func setUpDatePicker() {
        startDatePicker.addTarget(self, action: #selector(startDateChange), for: .valueChanged)
        contractStartDateTextField.inputView = startDatePicker

        endDatePicker.addTarget(self, action: #selector(endDateChange), for: .valueChanged)
        contractEndDateTextField.inputView = endDatePicker

        startTimePicker.addTarget(self, action: #selector(startTimeChange), for: .valueChanged)
        workingStartTimeTextField.inputView = startTimePicker

        endTimePicker.addTarget(self, action: #selector(endTimeChange), for: .valueChanged)
        workingEndTimeTextField.inputView = endTimePicker
    }

    @objc
    func startDateChange(_ sender: UIDatePicker) {
        contractStartDateTextField.text = dateFormat(date: sender.date)
    }

    @objc
    func endDateChange(_ sender: UIDatePicker) {
        contractEndDateTextField.text = dateFormat(date: sender.date)
    }

    @objc
    func startTimeChange(_ sender: UIDatePicker) {
        workingStartTimeTextField.text = timeFormat(time: sender.date)
    }

    @objc
    func endTimeChange(_ sender: UIDatePicker) {
        workingEndTimeTextField.text = timeFormat(time: sender.date)
    }

    private func dateFormat(date: Date) -> String {
        let formatter = DateFormatter().then {
            $0.dateFormat = "yyyy.MM.dd"
        }

        return formatter.string(from: date)
    }

    private func timeFormat(time: Date) -> String {
        let formatter = DateFormatter().then {
            $0.dateFormat = "HH:mm"
        }

        return formatter.string(from: time)
    }

    private func setUpStartDateToolBar() {
        let toolBar = UIToolbar()

        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(startDateDoneButtonHandeler))

        toolBar.translatesAutoresizingMaskIntoConstraints = false
        toolBar.items = [flexibleSpace, doneButton]
        toolBar.sizeToFit()

        contractStartDateTextField.delegate = self
        contractStartDateTextField.inputAccessoryView = toolBar
        contractStartDateTextField.tintColor = .clear
    }

    private func setUpEndDateToolBar() {
        let toolBar = UIToolbar()

        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(endDateDoneButtonHandeler))

        toolBar.translatesAutoresizingMaskIntoConstraints = false
        toolBar.items = [flexibleSpace, doneButton]
        toolBar.sizeToFit()

        contractEndDateTextField.delegate = self
        contractEndDateTextField.inputAccessoryView = toolBar
        contractEndDateTextField.tintColor = .clear
    }

    private func setUpStartTimeToolBar() {
        let toolBar = UIToolbar()

        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(startTimeDoneButtonHandeler))

        toolBar.translatesAutoresizingMaskIntoConstraints = false
        toolBar.items = [flexibleSpace, doneButton]
        toolBar.sizeToFit()

        workingStartTimeTextField.delegate = self
        workingStartTimeTextField.inputAccessoryView = toolBar
        workingStartTimeTextField.tintColor = .clear
    }

    private func setUpEndTimeToolBar() {
        let toolBar = UIToolbar()

        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(endTimeDoneButtonHandeler))

        toolBar.translatesAutoresizingMaskIntoConstraints = false
        toolBar.items = [flexibleSpace, doneButton]
        toolBar.sizeToFit()

        workingEndTimeTextField.delegate = self
        workingEndTimeTextField.inputAccessoryView = toolBar
        workingEndTimeTextField.tintColor = .clear
    }

    @objc func startDateDoneButtonHandeler(_ sender: UIBarButtonItem) {
        contractStartDateTextField.text = dateFormat(date: startDatePicker.date)
        contractStartDateTextField.resignFirstResponder()
    }

    @objc func endDateDoneButtonHandeler(_ sender: UIBarButtonItem) {
        contractEndDateTextField.text = dateFormat(date: endDatePicker.date)
        contractEndDateTextField.resignFirstResponder()
    }

    @objc func startTimeDoneButtonHandeler(_ sender: UIBarButtonItem) {
        workingStartTimeTextField.text = timeFormat(time: startTimePicker.date)
        workingStartTimeTextField.resignFirstResponder()
    }

    @objc func endTimeDoneButtonHandeler(_ sender: UIBarButtonItem) {
        workingEndTimeTextField.text = timeFormat(time: endTimePicker.date)
        workingEndTimeTextField.resignFirstResponder()
    }

    private func setDayModal() {
        let tapDayGesture = UITapGestureRecognizer(target: self, action: #selector(dayLabelTapped))
        workingDayContentLabel.addGestureRecognizer(tapDayGesture)
    }

    @objc func dayLabelTapped() {
        if workingDayContentLabel.text == "요일을 선택해주세요" {
            tapDayLabel?([])
        } else {
            let days = workingDayContentLabel.text
            let daysList = days?.split(separator: " ").compactMap { String($0) }
            tapDayLabel?(daysList ?? [])
        }
    }

    // MARK: Data binding
    func setData(data: ContractUpload) {
        if data.workplace != nil {
            workplaceTextField.setContractText(content: data.workplace ?? "nil")
        }

        if data.contractStartDate != nil {
            let contractStartDate = data.contractStartDate?.toDate(format: "yyyy.MM.dd")
            contractStartDateTextField.text = contractStartDate?.toDateString(format: "yyyy.MM.dd")
            let startDate = data.contractStartDate?.toDate(format: "yyyy.MM.dd")
            startDatePicker.date = startDate ?? Date()
        }
        if data.contractEndDate != nil {
            let contractEndDate = data.contractEndDate?.toDate(format: "yyyy.MM.dd")
            contractEndDateTextField.text = contractEndDate?.toDateString(format: "yyyy.MM.dd")
            let endDate = data.contractEndDate?.toDate(format: "yyyy.MM.dd")
            endDatePicker.date = endDate ?? Date()
        }

        if data.standardWorkingStartTime != nil {
            workingStartTimeTextField.text = data.standardWorkingStartTime
            let startTime = data.standardWorkingStartTime?.toTimeDate()
            startTimePicker.date = startTime ?? Date()
        }
        if data.standardWorkingEndTime != nil {
            workingEndTimeTextField.text = data.standardWorkingEndTime
            let endTime = data.standardWorkingEndTime?.toTimeDate()
            endTimePicker.date = endTime ?? Date()
        }

        if data.workingDays != nil {
            let dayString = data.workingDays?.map { dayMapping[$0] ?? $0 }
            let days = dayString?.joined(separator: " ")
            workingDayContentLabel.text = days
            workingDayContentLabel.textColor = .albaidGray20
            workingDayContentLabel.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        } else {
            workingDayContentLabel.text = "요일을 선택해주세요"
            workingDayContentLabel.textColor = .albaidGray60
            workingDayContentLabel.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        }

        if data.hourlyWage != nil {
            let hourlyWage = data.hourlyWage?.toPriceFormat
            hourlyWageTextField.setContractText(content: "\(hourlyWage ?? "nil")")
        }

        if data.jobDescription != nil {
            jobDescriptionTextField.setContractText(content: data.jobDescription ?? "nil")
        }

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
    }
}

extension ScanResultTopContentView {
    func setDetailData(data: ContractRequest) {
        workplaceTextField.isEnabled = false
        workplaceTextField.setContractText(content: data.workplace)

        contractStartDateTextField.isEnabled = false
        let contractStartDate = data.contractStartDate.toDate(format: "yyyy.MM.dd")
        contractStartDateTextField.text = contractStartDate?.toDateString(format: "yyyy.MM.dd")

        contractEndDateTextField.isEnabled = false
        if data.contractEndDate != nil {
            let contractEndDate = data.contractEndDate?.toDate(format: "yyyy.MM.dd")
            contractEndDateTextField.text = contractEndDate?.toDateString(format: "yyyy.MM.dd")
        }

        workingStartTimeTextField.isEnabled = false
        let startTime = String(data.standardWorkingStartTime.dropLast(3))
        workingStartTimeTextField.text = startTime

        workingEndTimeTextField.isEnabled = false
        let endTime = String(data.standardWorkingEndTime.dropLast(3))
        workingEndTimeTextField.text = endTime

        workingDayContentLabel.isUserInteractionEnabled = false
        let dayString = data.workingDays.map { dayMapping[$0] ?? $0 }
        let days = dayString.joined(separator: " ")
        workingDayContentLabel.text = days
        workingDayContentLabel.textColor = .albaidGray20
        workingDayContentLabel.font = UIFont(name: "Pretendard-SemiBold", size: 16)

        hourlyWageTextField.isEnabled = false
        let hourlyWage = data.hourlyWage.toPriceFormat
        hourlyWageTextField.setContractText(content: "\(hourlyWage)")

        jobDescriptionTextField.isEnabled = false
        jobDescriptionTextField.setContractText(content: data.jobDescription)

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
    }
}

extension ScanResultTopContentView {
    func setEditData(data: ContractRequest) {
        workplaceTextField.setContractText(content: data.workplace)

        let contractStartDate = data.contractStartDate.toDate(format: "yyyy.MM.dd")
        contractStartDateTextField.text = contractStartDate?.toDateString(format: "yyyy.MM.dd")

        if data.contractEndDate != nil {
            let contractEndDate = data.contractEndDate?.toDate(format: "yyyy.MM.dd")
            contractEndDateTextField.text = contractEndDate?.toDateString(format: "yyyy.MM.dd")
        }

        let startTime = String(data.standardWorkingStartTime.dropLast(3))
        workingStartTimeTextField.text = startTime

        let endTime = String(data.standardWorkingEndTime.dropLast(3))
        workingEndTimeTextField.text = endTime

        let dayString = data.workingDays.map { dayMapping[$0] ?? $0 }
        let days = dayString.joined(separator: " ")
        workingDayContentLabel.text = days
        workingDayContentLabel.textColor = .albaidGray20
        workingDayContentLabel.font = UIFont(name: "Pretendard-SemiBold", size: 16)

        let hourlyWage = data.hourlyWage.toPriceFormat
        hourlyWageTextField.setContractText(content: "\(hourlyWage)")

        jobDescriptionTextField.setContractText(content: data.jobDescription)

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
    }
}

extension ScanResultTopContentView: UITextFieldDelegate {
    private func setTextFieldDelegate() {
        hourlyWageTextField.delegate = self
        hourlyWageTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        let cleanedText = text.replacingOccurrences(of: ",", with: "")
        let numberFormatter = NumberFormatter().then {
            $0.numberStyle = .decimal
            $0.maximumFractionDigits = 0
        }
        
        if let number = Int(cleanedText) {
            let formattedText = numberFormatter.string(from: NSNumber(value: number))
            textField.text = formattedText
        }
    }
}

