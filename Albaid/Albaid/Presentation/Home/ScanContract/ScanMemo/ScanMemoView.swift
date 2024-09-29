//
//  ScanMemoView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ScanMemoView: BaseView {
    
    // MARK: UI Components
    private(set) var memoLabel = UILabel().then {
        $0.text = "간단한 메모를 입력할 수 있어요"
        $0.textColor = .albaidGray10
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 24)
    }

    private(set) var memoGuideLabel = UILabel().then {
        $0.text = AlbaidString.memoGuide
        $0.textColor = .albaidGray50
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.font = UIFont(name: "Pretendard-Regular", size: 15)
    }

    private(set) var memoTextView = UITextView().then {
        $0.text = "10분 전에 미리 도착하기"
        $0.textColor = .albaidGray20
        $0.textAlignment = .center
        $0.font = UIFont(name: "Pretendard-Medium", size: 16)
        $0.backgroundColor = .albaidGray95
        $0.layer.cornerRadius = 12
        $0.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }

    // MARK: Properties

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(memoLabel)
        addSubview(memoGuideLabel)
        addSubview(memoTextView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        memoLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(121)
            $0.centerX.equalToSuperview()
        }

        memoGuideLabel.snp.makeConstraints {
            $0.top.equalTo(memoLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }

        memoTextView.snp.makeConstraints {
            $0.top.equalTo(memoGuideLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().inset(26)
            $0.height.equalTo(100)
        }
    }
}
