//
//  HomeMenuView.swift
//  Albaid
//
//  Created by 박지윤 on 9/28/24.
//

import UIKit

final class HomeMenuView: BaseView {

    // MARK: UI Components
    private(set) var scanButton = BaseButton()
    private(set) var contractButton = BaseButton()
    private(set) var resumeButton = BaseButton()
    private(set) var divider = UIView()
    private(set) var divider2 = UIView()


    // MARK: Configuration
    override func configureSubviews() {
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }

    // MARK: Layout
    override func makeConstraints() {
    }
}
