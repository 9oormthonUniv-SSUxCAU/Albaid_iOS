
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

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Configuration
    override func configureSubviews() {
    }

    // MARK: Layout
    override func makeConstraints() {
    }

    override func setNavigationItem() {
        setDefaultNavigationItem(title: "알바 캘린더", leftBarButton: nil, rightBarButton: addButton)
    }
}
