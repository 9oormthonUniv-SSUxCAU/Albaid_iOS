//
//  FSCalendarView.swift
//  Albaid
//
//  Created by 박지윤 on 10/4/24.
//

import UIKit
import FSCalendar

final class FSCalendarView: BaseView {

    // MARK: UI Components
    let calendarView = FSCalendar().then {
        $0.locale = Locale(identifier: "ko_KR")
        $0.backgroundColor = .albaidGray100
        $0.scrollEnabled = true
        $0.scrollDirection = .horizontal

        $0.appearance.headerDateFormat = "YYYY년 M월"
        $0.appearance.headerTitleColor = .albaidGray20
        $0.appearance.headerTitleAlignment = .left
        $0.appearance.headerTitleFont = UIFont(name: "Pretendard-SemiBold", size: 20)
        $0.appearance.headerMinimumDissolvedAlpha = 0.0

        $0.appearance.weekdayTextColor = .albaidGray30
        $0.appearance.weekdayFont = UIFont(name: "Pretendard-SemiBold", size: 15)
 
        $0.appearance.titleDefaultColor = .albaidGray30
        $0.appearance.titleSelectionColor = .albaidGray30
        $0.appearance.titleFont = UIFont(name: "Pretendard-Medium", size: 14)

        $0.appearance.titleTodayColor = .albaidGray30
        $0.appearance.todaySelectionColor = .clear
        $0.appearance.todayColor = .clear
        $0.appearance.selectionColor = .clear
    }

    // MARK: Properties
    var tapDay: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(calendarView)

        setCalendarView()
    }

    // MARK: Layout
    override func makeConstraints() {
        calendarView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func setCalendarView() {
        calendarView.register(FSCalendarViewCell.self, forCellReuseIdentifier: FSCalendarViewCell.description())
        calendarView.delegate = self
        calendarView.dataSource = self
    }
}

extension FSCalendarView: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        guard let cell = calendar.dequeueReusableCell(withIdentifier: FSCalendarViewCell.description(), for: date, at: position) as? FSCalendarViewCell else { return FSCalendarCell() }

        if date == calendarView.today {
            cell.titleLabel.textColor = .red
        }

        return cell
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        tapDay?()
    }
}
