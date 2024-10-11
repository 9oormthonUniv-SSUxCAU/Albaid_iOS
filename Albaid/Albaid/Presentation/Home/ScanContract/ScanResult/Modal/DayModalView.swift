//
//  DayModalView.swift
//  Albaid
//
//  Created by 박지윤 on 10/8/24.
//

import UIKit

final class DayModalView: UIInputView {
    
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
    let dayOrder = ["월": 0, "화": 1, "수": 2, "목": 3, "금": 4, "토": 5, "일": 6]

    var selectedDays: [String] = []
    var onDismiss: (([String]) -> Void)?
    var onSelectedDays: (([String]) -> Void)?

    // MARK: Initializer
    override init(frame: CGRect, inputViewStyle: UIInputView.Style) {
        super.init(frame: frame, inputViewStyle: inputViewStyle)
        configureSubviews()
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: Configuration
    func configureSubviews() {
        backgroundColor = .albaidGray100

        addSubview(modalDividerView)
        addSubview(titleLabel)
        addSubview(dividerView)
        addSubview(dayStackView)
    }
    
    // MARK: Layout
    func makeConstraints() {
        modalDividerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(38)
            $0.height.equalTo(6)
        }

        snp.makeConstraints {
            $0.height.equalTo(190)
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
        if selectedDays.count > 1 {
            selectedDays.sort { dayOrder[$0]! < dayOrder[$1]! }
        }
        updateData(data: selectedDays)
        print("👀 \(selectedDays)")
        for day in days {
            let button = BaseButton().then {
                $0.setTitle(day, for: .normal)
                $0.setTitleColor(.albaidGray60, for: .normal)
                $0.setTitleColor(.albaidGray100, for: .selected)
                $0.layer.cornerRadius = 12
                $0.backgroundColor = .albaidGray95
                $0.isSelected = false
            }

            if selectedDays.contains(day) {
                print(day)
                toggleButtonStatus(button)
            }

            button.snp.makeConstraints {
                $0.height.equalTo(44)
            }

            button.accessibilityIdentifier = day
            button.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)

            dayStackView.addArrangedSubview(button)
        }
    }

    private func toggleButtonStatus(_ button: BaseButton) {
        button.isSelected.toggle()

        if button.isSelected {
            button.backgroundColor = .albaidGray20
        } else {
            button.backgroundColor = .albaidGray95
        }
    }

    // MARK: Event
    @objc func dayButtonTapped(_ sender: UIButton) {
        if let day = sender.currentTitle {
            if selectedDays.contains(day) {
                toggleButtonStatus(sender as! BaseButton)
                selectedDays.removeAll { $0 == day }
                if selectedDays.count > 1 {
                    selectedDays.sort { dayOrder[$0]! < dayOrder[$1]! }
                }
                updateData(data: selectedDays)
            } else {
                toggleButtonStatus(sender as! BaseButton)
                selectedDays.append(day)
                if selectedDays.count > 1 {
                    selectedDays.sort { dayOrder[$0]! < dayOrder[$1]! }
                }
                updateData(data: selectedDays)
            }
        }
    }

    func updateData(data: [String]) {
        onDismiss?(data)
    }

    func setData(data: [String]) {
        selectedDays = data
        setButtonStackView()
    }
}
