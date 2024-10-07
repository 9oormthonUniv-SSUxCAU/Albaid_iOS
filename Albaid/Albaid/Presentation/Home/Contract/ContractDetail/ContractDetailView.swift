//
//  ContractDetailView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ContractDetailView: BaseView {
    
    // MARK: UI Components
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }

    private let contractEntireView = UIView()

    private(set) var contractImageView = UIImageView().then {
        $0.image = AlbaidImage.dummyContract
        $0.backgroundColor = .albaidGray90
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 12
    }

    private(set) var magnifierButton = BaseButton().then {
        $0.setImage(AlbaidButton.magnifier, for: .normal)
    }

    private(set) var dividerView = UIView().then {
        $0.backgroundColor = .albaidGray70
    }

    private(set) var scanResultTopContentView = ScanResultTopContentView()

    private(set) var dividerView2 = UIView().then {
        $0.backgroundColor = .albaidGray70
    }

    private(set) var scanResultBottomContentView = ScanResultBottomContentView()

    private(set) var memoLabel = UILabel().then {
        $0.text = "메모"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
    }

    private(set) var memoBackgroundView = UIView().then {
        $0.backgroundColor = .albaidGray95
        $0.layer.cornerRadius = 12
    }

    private(set) var memoContentLabel = UILabel().then {
        $0.textColor = .albaidGray20
        $0.numberOfLines = 0
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
    }

    private(set) var nonScrollView = UIView()

    private(set) var buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 13
        $0.distribution = .fillEqually
    }

    private(set) var registerContractButton = BaseButton().then {
        $0.setTextButton(title: "이력서 등록하기", titleColor: .albaidGray20, backgroundColor: .albaidGray95)
    }

    private(set) var registerCardButton = BaseButton().then {
        $0.setTextButton(title: "알바 카드 등록하기", titleColor: .albaidGray100, backgroundColor: .albaidGray20)
    }

    // MARK: Properties

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contractEntireView)

        contractEntireView.addSubview(contractImageView)
        contractImageView.addSubview(magnifierButton)
        contractEntireView.addSubview(dividerView)

        contractEntireView.addSubview(scanResultTopContentView)
        contractEntireView.addSubview(dividerView2)
        contractEntireView.addSubview(scanResultBottomContentView)
        contractEntireView.addSubview(memoLabel)
        contractEntireView.addSubview(memoBackgroundView)
        memoBackgroundView.addSubview(memoContentLabel)

        addSubview(nonScrollView)
        nonScrollView.addSubview(buttonStackView)
        buttonStackView.addArrangedSubviews(registerContractButton,
                                            registerCardButton)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        scrollView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(121)
        }

        let screenWidth = UIScreen.main.bounds.width

        contractEntireView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.width.equalTo(screenWidth - 40)
        }

        contractImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(386)
        }

        magnifierButton.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(20)
            $0.height.width.equalTo(32)
        }

        dividerView.snp.makeConstraints {
            $0.top.equalTo(contractImageView.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }

        scanResultTopContentView.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(259)
        }

        dividerView2.snp.makeConstraints {
            $0.top.equalTo(scanResultTopContentView.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }

        scanResultBottomContentView.snp.makeConstraints {
            $0.top.equalTo(dividerView2.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(142)
        }

        memoLabel.snp.makeConstraints {
            $0.top.equalTo(scanResultBottomContentView.snp.bottom).offset(30)
            $0.leading.equalToSuperview()
        }

        memoBackgroundView.snp.makeConstraints {
            $0.top.equalTo(memoLabel.snp.bottom).offset(10)
            $0.height.equalTo(97)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(30)
        }

        memoContentLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        nonScrollView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.bottom)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }

        buttonStackView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
    }

    func setData(data: Contract) {
        memoContentLabel.text = data.memo
    }
}
