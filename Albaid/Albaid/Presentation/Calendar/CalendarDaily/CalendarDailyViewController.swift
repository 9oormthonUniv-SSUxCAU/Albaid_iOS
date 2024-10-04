//
//  CalendarDailyViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

class CalendarDailyViewController: BaseViewController {

    // MARK: UI Components
    private(set) var backButton = BaseButton().then {
        $0.setImage(AlbaidButton.back.withTintColor(.albaidGray30), for: .normal)
    }

    private let calendarDailyView = CalendarDailyView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
    }

    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(calendarDailyView)
    }

    // MARK: Layout
    override func makeConstraints() {
        calendarDailyView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: nil, leftBarButton: backButton, rightBarButton: nil)
    }

    // MARK: View Transition
    override func viewTransition() {
        backButton.tap = { [weak self] in
            guard let self else { return }
            router.popViewController()
        }
        
        calendarDailyView.tapOption = { [weak self] in
            guard let self else { return }
            router.presentModalViewController()
        }
    }
}
