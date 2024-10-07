//
//  CalendarWeeklyViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

class CalendarWeeklyViewController: BaseViewController {

    // MARK: UI Components
    private(set) var backButton = BaseButton().then {
        $0.setImage(AlbaidButton.back.withTintColor(.albaidGray30), for: .normal)
    }

    private let addButton = BaseButton().then {
        $0.setImage(AlbaidButton.add, for: .normal)
    }

    private let calendarWeeklyView = CalendarWeeklyView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
    }

    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(calendarWeeklyView)
    }

    // MARK: Layout
    override func makeConstraints() {
        calendarWeeklyView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.width.bottom.equalToSuperview()
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: "9월", leftBarButton: backButton, rightBarButton: addButton)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    // MARK: View Transition
    override func viewTransition() {
        backButton.tap = { [weak self] in
            guard let self else { return }
            router.popViewController()
        }

        calendarWeeklyView.tapCell = { [weak self] in
            guard let self else { return }
            router.presentCalendarDailyViewController()
        }
    }
}
