//
//  FSCalendarViewCell.swift
//  Albaid
//
//  Created by 박지윤 on 10/4/24.
//

import UIKit
import FSCalendar

final class FSCalendarViewCell: FSCalendarCell {

    static let identifier = "FSCalendarViewCell"

    // MARK: UI Components
    private(set) var cardView = UIView().then {
        $0.backgroundColor = .albaidGreen30.withAlphaComponent(0.2)
        $0.layer.cornerRadius = 2
    }

    private(set) var albaLabel = UILabel().then {
        $0.text = "알바1"
        $0.textColor = .albaidGreen30
        $0.font = UIFont(name: "Pretendard-Medium", size: 11)
    }

    private(set) var dividerView = DividerView(dividerType: .thin)

    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureSubviews()
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configuration
    private func configureSubviews() {
        contentView.addSubview(cardView)

        cardView.addSubview(albaLabel)
        contentView.addSubview(dividerView)
    }

    // MARK: Layout
    private func makeConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(7)
            $0.centerX.equalToSuperview()
        }

        cardView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(2)
            $0.height.equalTo(20)
        }

        albaLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(6)
        }

        dividerView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
        }
    }

    func setData(data: Card?) {
    }
}

