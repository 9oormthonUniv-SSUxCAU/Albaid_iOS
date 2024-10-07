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

    // MARK: Properties
    let month: Int

    // MARK: Init
    init(month: Int) {
        self.month = month
        super.init(nibName: nil, bundle: nil)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setData(month: month, data: Contract.dummyContract)
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
        setDefaultNavigationItem(title: "\(month)월", leftBarButton: backButton, rightBarButton: nil)
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

    // MARK: Data binding
    private func setData(month: Int, data: [Contract]) {
        calendarWeeklyView.setData(month: month, data: data)
    }
}
