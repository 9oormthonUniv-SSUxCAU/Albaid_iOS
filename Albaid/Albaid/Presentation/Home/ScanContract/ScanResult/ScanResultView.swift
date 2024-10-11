//
//  ScanResultView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ScanResultView: BaseView {

    // MARK: UI Components
    private(set) var scanResultLabel = UILabel().then {
        $0.text = AlbaidString.scanResult
        $0.textColor = .albaidGray20
        $0.numberOfLines = 2
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 28)
    }

    private(set) var scanResultTipView = UIView().then {
        $0.layer.cornerRadius = 12
        $0.backgroundColor = .albaidLightGreen
    }

    private(set) var safetyImageView = UIImageView().then {
        $0.image = AlbaidImage.safety
        $0.contentMode = .scaleAspectFit
    }

    private(set) var safetyLabel = UILabel().then {
        $0.text = AlbaidString.safety
        $0.textColor = .albaidSafetyGreen
        $0.numberOfLines = 2
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
    }

    private(set) var dangerDetailButton = BaseButton().then {
        $0.setImage(AlbaidButton.dangerDetail, for: .normal)
    }

    private(set) var scanResultTopContentView = ScanResultTopContentView()
    
    private(set) var dividerView = UIView().then {
        $0.backgroundColor = .albaidGray70
    }

    private(set) var scanResultBottomContentView = ScanResultBottomContentView().then {
        $0.layer.cornerRadius = 12
        $0.backgroundColor = .albaidGray95
    }

    private(set) var buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 13
        $0.distribution = .fillEqually
    }

    private(set) var reScanButton = BaseButton().then {
        $0.setTextButton(title: "다시 촬영하기", titleColor: .albaidGray20, backgroundColor: .albaidGray95)
    }

    private(set) var registerButton = BaseButton().then {
        $0.setTextButton(title: "등록하기", titleColor: .albaidGray100, backgroundColor: .albaidGray20)
    }

    // MARK: Properties
    var tapReScan: (() -> Void)?
    var tapRegister: ((ContractInput) -> Void)?
    var tapDangerDetail: (() -> Void)?
    var contratScanData: ContractUpload?
    var contractInput = ContractInput(title: "",
                                      workplace: "",
                                      contractStartDate: "",
                                      contractEndDate: "",
                                      standardWorkingStartTime: "",
                                      standardWorkingEndTime: "",
                                      workingDays: [""],
                                      hourlyWage: 0,
                                      jobDescription: "",
                                      isPaidAnnualLeave: false,
                                      isSocialInsurance: false,
                                      isContractDelivery: false,
                                      memo: "")

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(scanResultLabel)
        addSubview(scanResultTipView)

        scanResultTipView.addSubview(safetyImageView)
        scanResultTipView.addSubview(safetyLabel)

        addSubview(scanResultTopContentView)
        addSubview(dividerView)
        addSubview(scanResultBottomContentView)
        addSubview(buttonStackView)
        buttonStackView.addArrangedSubviews(reScanButton, registerButton)

        addButtonEvent()
    }

    // MARK: Layout
    override func makeConstraints() {
        scanResultLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(123)
            $0.leading.equalToSuperview()
        }

        scanResultTipView.snp.makeConstraints {
            $0.top.equalTo(scanResultLabel.snp.bottom).offset(25)
            $0.width.equalToSuperview()
        }

        safetyImageView.snp.makeConstraints {
            $0.top.equalTo(safetyLabel.snp.top)
            $0.leading.equalToSuperview().inset(20)
            $0.height.width.equalTo(24)
        }

        safetyLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(safetyImageView.snp.trailing).offset(10)
        }

        scanResultTopContentView.snp.makeConstraints {
            $0.top.equalTo(scanResultTipView.snp.bottom).offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(259)
        }

        dividerView.snp.makeConstraints {
            $0.top.equalTo(scanResultTopContentView.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }

        scanResultBottomContentView.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(142)
        }

        buttonStackView.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(30)
            $0.horizontalEdges.equalToSuperview()
        }
    }

    // MARK: Event
    private func addButtonEvent() {
        reScanButton.addTarget(self, action: #selector(handleReScanButton), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(handleRegisterButton), for: .touchUpInside)
        dangerDetailButton.addTarget(self, action: #selector(handleDangerDetailButton), for: .touchUpInside)
    }

    @objc
    private func handleReScanButton() {
        tapReScan?()
    }

    @objc
    private func handleRegisterButton() {
        let view = scanResultTopContentView
        contractInput.title = view.workplaceTextField.text ?? ""

        // TODO: TBD
//        contractInput.occupation = view.workplaceTextField.text ?? ""

        contractInput.workplace = view.workplaceTextField.text ?? ""

        let startDate = view.contractStartDateTextField.text?.toDate(format: "yyyy-MM-dd")
        let startDateString = startDate?.toDateString(format: "yyyy-MM-dd")
        contractInput.contractStartDate = startDateString ?? ""
        let endDate = view.contractEndDateTextField.text?.toDate(format: "yyyy-MM-dd")
        let endDateString = endDate?.toDateString(format: "yyyy-MM-dd")
        contractInput.contractEndDate = endDateString ?? ""

        contractInput.standardWorkingStartTime = view.workingStartTimeTextField.text ?? ""
        contractInput.standardWorkingEndTime = view.workingEndTimeTextField.text ?? ""

        let workingDays = view.workingDayContentLabel.text
        let reverseDayMapping: [String: String] = [
            "월": "MO",
            "화": "TU",
            "수": "WE",
            "목": "TH",
            "금": "FR",
            "토": "SA",
            "일": "SU"
        ]

        let ENGDays = workingDays?.split(separator: " ").compactMap { reverseDayMapping[String($0)] }

        contractInput.workingDays = ENGDays ?? []
        let hourlyWage = view.hourlyWageTextField.text
        contractInput.hourlyWage = hourlyWage?.revertPriceFormat ?? 0
        contractInput.jobDescription = view.jobDescriptionTextField.text ?? ""

        tapRegister?(contractInput)
    }

    @objc
    private func handleDangerDetailButton() {
        tapDangerDetail?()
    }

    func setData(data: ContractUpload) {
        contractInput.isPaidAnnualLeave = data.isPaidAnnualLeave
        contractInput.isSocialInsurance = data.isSocialInsurance
        contractInput.isContractDelivery = data.isContractDelivery

        setToolTip(isSafe: data.isSafe)
    }

    private func setToolTip(isSafe: Bool) {
        if isSafe {
            scanResultTipView.backgroundColor = .albaidLightGreen
            scanResultTipView.snp.makeConstraints {
                $0.height.equalTo(76)
            }
            safetyImageView.image = AlbaidImage.safety
            safetyLabel.text = AlbaidString.safety
            safetyLabel.textColor = .albaidSafetyGreen
        } else {
            scanResultTipView.backgroundColor = .albaidLightRed
            scanResultTipView.snp.makeConstraints {
                $0.height.equalTo(57)
            }
            safetyImageView.snp.makeConstraints {
                $0.centerY.equalToSuperview()
            }
            scanResultTipView.addSubview(dangerDetailButton)
            dangerDetailButton.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.trailing.equalToSuperview().inset(16)
                $0.height.equalTo(29)
                $0.width.equalTo(72)
            }
            safetyImageView.image = AlbaidImage.danger
            safetyLabel.text = AlbaidString.danger
            safetyLabel.textColor = .albaidSafetyRed
        }
    }
}
