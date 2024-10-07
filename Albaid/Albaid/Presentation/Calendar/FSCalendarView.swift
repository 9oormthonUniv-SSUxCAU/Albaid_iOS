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
        $0.appearance.headerTitleAlignment = .center
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
    var tapDay: ((Int) -> Void)?
    var contract: [Contract] = []
    let dayMapping: [String: Int] = ["일": 1, "월": 2, "화": 3, "수": 4, "목": 5, "금": 6, "토": 7]

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

    func setData(data: [Contract]) {
        contract = data
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

        let weekday = getWeekday(from: date)

        cell.subviews.forEach { subview in
            if subview is UIStackView {
                subview.removeFromSuperview()
            }
        }

        let cardViewStackView = UIStackView().then {
            $0.axis = .vertical
            $0.spacing = 4
        }

        for con in contract {
            if con.workingDays.contains(weekday) {
                var color: UIColor
                var textColor: UIColor

                switch (con.id + 1) % 3 {
                case 0:
                    color = .albaidPink50
                    textColor = .albaidSubPink
                case 1:
                    color = .albaidGreen20
                    textColor = .albaidGreen10
                case 2:
                    color = .albaidBlue20
                    textColor = .albaidSubBlue
                default:
                    color = .albaidGreen20
                    textColor = .albaidGreen10
                }

                let cardView = CalendarCardView(color: color,
                                                textColor: textColor,
                                                text: "알바\(con.id + 1)")
                cell.addSubview(cardViewStackView)
                cardViewStackView.addArrangedSubview(cardView)

                cardViewStackView.snp.makeConstraints {
                    $0.top.equalToSuperview().inset(30)
                    $0.horizontalEdges.equalToSuperview().inset(2)
                }
            }
        }

        return cell
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "M"
        let string = dateFormatter.string(from: date)
        let month = Int(string) ?? 0

        tapDay?(month)
    }

    func getWeekday(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "E"
        return dateFormatter.string(from: date)
    }
}
