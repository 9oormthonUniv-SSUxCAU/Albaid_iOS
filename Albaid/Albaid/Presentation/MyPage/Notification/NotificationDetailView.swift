//
//  NotificationDetailView.swift
//  Albaid
//
//  Created by 박지윤 on 10/3/24.
//

import UIKit

final class NotificationDetailView: BaseView {

    // MARK: UI Components
    private(set) var titleLabel = UILabel().then {
        $0.text = "회원가입을 축하드려요!"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
    }

    private(set) var dateLabel = UILabel().then {
        $0.text = "2024.09.22"
        $0.textColor = .albaidGray60
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
    }

    private let dividerView = DividerView(dividerType: .thin)

    private(set) var contentLabel = UILabel().then {
        $0.text = AlbaidString.dummyNoti
        $0.textColor = .albaidGray30
        $0.numberOfLines = 0
        $0.font = UIFont(name: "Pretendard-Medium", size: 16)
    }

    
    // MARK: Configuration
    override func configureSubviews() {
        addSubview(titleLabel)
        addSubview(dateLabel)
        addSubview(dividerView)
        addSubview(contentLabel)
    }

    // MARK: Layout
    override func makeConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(20)
        }

        dateLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(7)
            $0.leading.equalToSuperview().inset(20)
        }

        dividerView.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        contentLabel.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(20)
        }
    }
}
