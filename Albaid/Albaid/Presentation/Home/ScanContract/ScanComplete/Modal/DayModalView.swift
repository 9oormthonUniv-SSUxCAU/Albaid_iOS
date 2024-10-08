//
//  DayModalView.swift
//  Albaid
//
//  Created by 박지윤 on 10/8/24.
//

import UIKit

final class DayModalView: BaseView {
    
    // MARK: UI Components
    private(set) var modalDividerView = UIView().then {
        $0.backgroundColor = .albaidGray70
        $0.layer.cornerRadius = 3
    }

    private(set) var titleLabel = UILabel().then {
        $0.text = "근무 일자를 선택해주세요"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
    }

    private(set) var dividerView = DividerView(dividerType: .thin)

    private(set) var dayStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 5
        $0.distribution = .fillEqually
    }

    // MARK: Properties
    let days = ["월", "화", "수", "목", "금", "토", "일"]
    var selectedDays: [String] = []
    var onDismiss: (([String]) -> Void)?
    var onSelectedDays: (([String]) -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        setButtonStackView()

        addSubview(modalDividerView)
        addSubview(titleLabel)
        addSubview(dividerView)
        addSubview(dayStackView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        modalDividerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(38)
            $0.height.equalTo(6)
        }
    
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(modalDividerView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        dividerView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        dayStackView.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(20)
            $0.height.equalTo(44)
            $0.width.horizontalEdges.equalToSuperview().inset(20)
        }
    }

    private func setButtonStackView() {
        for day in days {
            let button = BaseButton().then {
                $0.setTitle(day, for: .normal)
                $0.setTitleColor(.albaidGray60, for: .normal)
                $0.setTitleColor(.albaidGray100, for: .selected)
                $0.layer.cornerRadius = 12
                $0.backgroundColor = .albaidGray95
            }

            button.snp.makeConstraints {
                $0.height.equalTo(44)
            }
            
            button.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)

            dayStackView.addArrangedSubview(button)
        }
    }

    // MARK: Event
    @objc func dayButtonTapped(_ sender: UIButton) {
        if let day = sender.currentTitle {
            if selectedDays.contains(day) {
                selectedDays.removeAll { $0 == day }
                sender.isSelected.toggle()
                sender.backgroundColor = .albaidGray95
                updateData(data: selectedDays)
            } else {
                selectedDays.append(day)
                sender.isSelected.toggle()
                sender.backgroundColor = .albaidGray20
                updateData(data: selectedDays)
            }
        }
    }

    func updateData(data: [String]) {
        onDismiss?(data)
    }
}
