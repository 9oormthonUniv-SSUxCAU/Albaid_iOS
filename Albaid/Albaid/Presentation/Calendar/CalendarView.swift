//
//  CalendarView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class CalendarView: BaseView {

    // MARK: UI Components
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }

    private let entireView = UIView()

    private let calendarBackgroundView = UIView().then {
        $0.backgroundColor = .albaidGray100
    }

    private(set) var calendarView = FSCalendarView()
    private(set) var calendarBottomView = CalendarBottomView()

    // MARK: Properties
    var contract: [Contract] = []
    var todayContract: [Contract] = []

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(scrollView)

        scrollView.addSubview(entireView)

        entireView.addSubview(calendarBackgroundView)
        calendarBackgroundView.addSubview(calendarView)

        entireView.addSubview(calendarBottomView)
        backgroundColor = .albaidGray95
    }

    // MARK: Layout
    override func makeConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        entireView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        calendarBackgroundView.snp.makeConstraints {
            $0.top.width.equalToSuperview()
            $0.height.equalTo(630)
        }

        calendarView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(620)
        }
    }

    // MARK: Data binding
    func setData(data: [Contract]) {
        contract = data
        getTodayContract()
    }

    func getTodayWeekday() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "E"
        return dateFormatter.string(from: Date())
    }

    func getTodayContract() {
        let todayWeekday = getTodayWeekday()

        todayContract = contract.filter { contract in
            contract.workingDays.contains(todayWeekday)
        }

        let cellHeight = 70
        let cellCount = todayContract.count

        calendarBottomView.snp.makeConstraints {
            $0.top.equalTo(calendarView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(62 + cellHeight * cellCount)
        }
    }
}
