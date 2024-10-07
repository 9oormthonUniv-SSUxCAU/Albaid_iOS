//
//  CareerListStackView.swift
//  Albaid
//
//  Created by 박지윤 on 9/30/24.
//

import UIKit

final class CareerListStackView: UIStackView {

    // MARK: Properties
    var resume: Resume?

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
        if resume?.careers.count != 0 {
            for i in 1...(resume?.careers.count ?? 0) {
                let careerListView = CareerListView()
                careerListView.careerContentView.setData(data: resume?.careers[i-1])
                addArrangedSubview(careerListView)
                
                switch i {
                case 1: careerListView.topLineView.removeFromSuperview()
                case resume?.careers.count ?? 0:
                    careerListView.bottomLineView.removeFromSuperview()
                default:
                    break
                }
            }
        }
    }

    // MARK: Data binding
    func setViewData(data: Resume) {
        resume = data
    }
}
