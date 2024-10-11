//
//  DividerView.swift
//  Albaid
//
//  Created by 박지윤 on 9/30/24.
//

import UIKit

enum Divider {
    case thin
    case thick

    var height: CGFloat {
        switch self {
        case .thin:
            return 1.0
        case .thick:
            return 8.0
        }
    }

    var color: UIColor {
        switch self {
        case .thin:
            return .albaidGray70
        case .thick:
            return .albaidGray95
        }
    }
}

class DividerView: BaseView {

    // MARK: UI Component
    private let dividerView = UIView()

    // MARK: Properties
    private var dividerType: Divider

    // MARK: Initializer
    init(dividerType: Divider) {
        self.dividerType = dividerType
        super.init(frame: .zero)

        configureSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configuration
    override func configureSubviews() {
        super.configureSubviews()

        dividerView.backgroundColor = dividerType.color

        addSubview(dividerView)
    }

    // MARK: Layout
    override func makeConstraints() {
        super.makeConstraints()

        dividerView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(dividerType.height)
        }
    }
}

