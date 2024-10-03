//
//  NotificationEmptyView.swift
//  Albaid
//
//  Created by 박지윤 on 10/3/24.
//

import UIKit

final class NotificationEmptyView: BaseView {

    // MARK: UI Components
    private(set) var emptyLabel = UILabel().then {
        $0.text = "새로운 알림이 없습니다."
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
    }

    private(set) var emptyContentLabel = UILabel().then {
        $0.text = "최근 30일 동안의 알림만 확인 가능합니다."
        $0.textColor = .albaidGray50
        $0.font = UIFont(name: "Pretendard-Regular", size: 15)
    }
    
    // MARK: Configuration
    override func configureSubviews() {
        addSubview(emptyLabel)
        addSubview(emptyContentLabel)
    }

    // MARK: Layout
    override func makeConstraints() {
        emptyLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(160)
            $0.centerX.equalToSuperview()
        }

        emptyContentLabel.snp.makeConstraints {
            $0.top.equalTo(emptyLabel.snp.bottom).offset(13)
            $0.centerX.equalToSuperview()
        }
    }
}
