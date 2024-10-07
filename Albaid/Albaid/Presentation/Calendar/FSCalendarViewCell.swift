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
        contentView.addSubview(dividerView)
    }

    // MARK: Layout
    private func makeConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(7)
            $0.centerX.equalToSuperview()
        }

        dividerView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
        }
    }

    func setData(data: Card?) {
    }
}

