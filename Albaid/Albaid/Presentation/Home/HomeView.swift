//
//  HomeView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class HomeView: BaseView {

    // MARK: UI Components
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }

    private let homeParentView = UIView()
    private(set) var homeTodayView = HomeTodayView()

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(scrollView)

        scrollView.addSubview(homeParentView)

        homeParentView.addSubview(homeTodayView)
    }

    // MARK: Layout
    override func makeConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        homeParentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        homeTodayView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(106)
        }
    }
}
