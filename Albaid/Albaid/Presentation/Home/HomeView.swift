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

    private(set) var homeParentView = UIView()
    private(set) var homeTodayView = HomeTodayView()
    private(set) var homeCardCollectionView = HomeCardCollectionView()
    private(set) var homeAdView = HomeAdView()
    private(set) var homeBottomView = UIView().then {
        $0.backgroundColor = .gray95
    }

    private(set) var homeMenuView = HomeMenuView()
    private(set) var homeContentView = HomeContentView()

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(scrollView)

        scrollView.addSubview(homeParentView)

        homeParentView.addSubview(homeTodayView)
        homeParentView.addSubview(homeCardCollectionView)
        homeParentView.addSubview(homeAdView)
        homeParentView.addSubview(homeBottomView)

        homeBottomView.addSubview(homeMenuView)
        homeBottomView.addSubview(homeContentView)
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
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(106)
        }

        homeCardCollectionView.snp.makeConstraints {
            $0.top.equalTo(homeTodayView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(192)
        }

        homeAdView.snp.makeConstraints {
            $0.top.equalTo(homeCardCollectionView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo((70))
        }

        homeBottomView.snp.makeConstraints {
            $0.top.equalTo(homeAdView.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(467)
        }

        homeMenuView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(120)
        }

        homeContentView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(327)
        }
    }
}
