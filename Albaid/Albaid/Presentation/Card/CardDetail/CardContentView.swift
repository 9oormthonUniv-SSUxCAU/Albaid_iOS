//
//  CardContentView.swift
//  Albaid
//
//  Created by 박지윤 on 9/30/24.
//

import UIKit

final class CardContentView: BaseView {

    // MARK: UI Components
    private(set) var titleLabel = UILabel().then {
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 24)
    }

    private(set) var categoryLabel = UILabel().then {
        $0.textColor = .albaidGray60
        $0.font = UIFont(name: "Pretendard-Medium", size: 16)
    }

    private(set) var contractButton = BaseButton().then {
        $0.setImage(AlbaidButton.file, for: .normal)
    }

    private(set) var cardContentDetailView = CardContentDetailView()

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

    // MARK: Properties
    var tapContract: ((Int) -> Void)?
    var contract: Contract?

    // MARK: Configuration
    override func configureSubviews() {
        setLayer()
        addButtonEvent()

        addSubview(titleLabel)
        addSubview(categoryLabel)
        addSubview(contractButton)
        addSubview(cardContentDetailView)
        addSubview(memoLabel)
        addSubview(memoBackgroundView)
        memoBackgroundView.addSubview(memoContentLabel)
    }

    // MARK: Layout
    override func makeConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().inset(20)
        }

        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(20)
        }

        contractButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(38)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.width.equalTo(44)
        }

        cardContentDetailView.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(494)
        }

        memoLabel.snp.makeConstraints {
            $0.top.equalTo(cardContentDetailView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
        }

        memoBackgroundView.snp.makeConstraints {
            $0.top.equalTo(memoLabel.snp.bottom).offset(10)
            $0.height.equalTo(97)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(30)
        }

        memoContentLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }

    private func setLayer() {
        layer.cornerRadius = 20
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        backgroundColor = .albaidGray100
    }

    // MARK: Data
    func setData(data: Contract) {
        contract = data
        titleLabel.text = data.title
        categoryLabel.text = data.jobDescription
        memoContentLabel.text = data.memo
    }

    // MARK: Event
    private func addButtonEvent() {
        contractButton.addTarget(self, action: #selector(handleContractButton), for: .touchUpInside)
    }

    @objc
    private func handleContractButton() {
        tapContract?(contract?.id ?? 0)
    }
}
