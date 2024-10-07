//
//  CalendarCardView.swift
//  Albaid
//
//  Created by 박지윤 on 10/8/24.
//

import UIKit

final class CalendarCardView: BaseView {
    
    // MARK: UI Components
    private(set) var albaLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Medium", size: 11)
    }

    // MARK: Init
    init(color: UIColor, textColor: UIColor, text: String) {
        super.init(frame: .zero)
        setView(color: color, textColor: textColor, text: text)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configuration
    override func configureSubviews() {
        layer.cornerRadius = 4

        addSubview(albaLabel)
    }

    // MARK: Layout
    override func makeConstraints() {
        snp.makeConstraints {
            $0.height.equalTo(20)
        }

        albaLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(6)
        }
    }

    private func setView(color: UIColor, textColor: UIColor, text: String) {
        backgroundColor = color
        albaLabel.text = text
        albaLabel.textColor = textColor
    }
}
