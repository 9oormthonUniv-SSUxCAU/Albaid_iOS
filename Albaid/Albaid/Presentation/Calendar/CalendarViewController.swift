
//
//  CalendarViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

class CalendarViewController: BaseViewController {

    // MARK: UI Components
    private let addButton = BaseButton().then {
        $0.setImage(AlbaidButton.add, for: .normal)
    }

    private let calendarView = CalendarView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
    }

    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(calendarView)
    }

    // MARK: Layout
    override func makeConstraints() {
        calendarView.snp.makeConstraints {
            $0.bottom.horizontalEdges.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        addButton.tap = { [weak self] in
            guard let self else { return }
            // TODO:
//            router.presentModalViewController()
        }

        calendarView.calendarView.tapDay = { [weak self] in
            guard let self else { return }
            router.presentCalendarWeeklyViewController()
        }

        calendarView.calendarBottomView.tapOption = { [weak self] in
            guard let self else { return }
//            router.presentModalViewController()
        }
    }

    override func setNavigationItem() {
        setDefaultNavigationItem(title: "알바 캘린더", leftBarButton: nil, rightBarButton: addButton)
    }
}
