//
//  CareerListView.swift
//  Albaid
//
//  Created by 박지윤 on 9/30/24.
//

import UIKit

final class CareerListView: BaseView {
    
    // MARK: UI Components
    private(set) var topLineView = UIView().then {
        $0.backgroundColor = .albaidGray60
    }

    private(set) var circleView = UIView().then {
        $0.backgroundColor = .albaidGray30
        $0.layer.cornerRadius = 10
    }

    private(set) var bottomLineView = UIView().then {
        $0.backgroundColor = .albaidGray60
    }

    private(set) var careerContentView = CareerContentView()

    // MARK: Properties

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(topLineView)
        addSubview(circleView)
        addSubview(bottomLineView)
        addSubview(careerContentView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        topLineView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
            $0.bottom.equalTo(circleView.snp.top)
            $0.width.equalTo(1)
        }
        
        circleView.snp.makeConstraints {
            $0.centerY.leading.equalToSuperview()
            $0.height.width.equalTo(20)
        }
        
        bottomLineView.snp.makeConstraints {
            $0.top.equalTo(circleView.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
            $0.width.equalTo(1)
        }
        
        careerContentView.snp.makeConstraints {
            $0.leading.equalTo(circleView.snp.trailing).offset(20)
            $0.centerY.equalToSuperview()
        }
    }

//    // MARK: Data binding
//    func setData(data: Career?) {
//        
//    }
}
