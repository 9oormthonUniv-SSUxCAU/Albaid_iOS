//
//  CareerListStackView.swift
//  Albaid
//
//  Created by 박지윤 on 9/30/24.
//

import UIKit

final class CareerListStackView: UIStackView {

    // MARK: Init
    init() {
        super.init(frame: .zero)

        configureSubviews()
        makeConstraints()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configuration
    private func configureSubviews() {
        axis = .vertical
        distribution = .fillEqually
    }

    // MARK: Layout
    private func makeConstraints() {

    }

    func setData() {
        for i in 0...2 {
            let careerListView = CareerListView()
            addArrangedSubview(careerListView)

            switch i {
            case 0: careerListView.topLineView.removeFromSuperview()
            case 2:
                careerListView.bottomLineView.removeFromSuperview()
            default:
                break
            }
        }
    }
}
