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
    private let calendarBottomView = CalendarBottomView()

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(scrollView)

        scrollView.addSubview(entireView)

        entireView.addSubview(calendarBackgroundView)
        calendarBackgroundView.addSubview(calendarView)

        entireView.addSubview(calendarBottomView)
        calendarView.backgroundColor = .yellow
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
            $0.height.equalTo(645)
        }

        calendarView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(620)
        }

        calendarBottomView.snp.makeConstraints {
            $0.top.equalTo(calendarView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(202)
        }
    }
}
