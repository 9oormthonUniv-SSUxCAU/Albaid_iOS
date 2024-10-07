//
//  ContractCollectionViewCell.swift
//  Albaid
//
//  Created by 박지윤 on 9/29/24.
//

import UIKit

final class ContractCollectionViewCell: UICollectionViewCell {

    static let identifier = "ContractCollectionViewCell"

    // MARK: UI Components
    private(set) var contractImageView = UIImageView().then {
        $0.image = AlbaidImage.dummyContract
        $0.layer.cornerRadius = 12
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    private(set) var contractSubView = UIView().then {
        $0.backgroundColor = .albaidGray30
        $0.layer.cornerRadius = 12
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }

    private(set) var contractNameLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "Pretendard-Medium", size: 16)
    }

    private(set) var optionButton = BaseButton().then {
        $0.setImage(AlbaidButton.menu.withTintColor(.white), for: .normal)
    }

    // MARK: Properties
    var tapOption: (() -> Void)?

    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureSubviews()
        makeConstraints()
        addButtonEvent()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configuration
    private func configureSubviews() {
        contentView.addSubview(contractImageView)
        contentView.addSubview(contractSubView)

        contractSubView.addSubview(contractNameLabel)
        contractSubView.addSubview(optionButton)
    }

    // MARK: Layout
    private func makeConstraints() {
        contractImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(96)
        }

        contractSubView.snp.makeConstraints {
            $0.top.equalTo(contractImageView.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }

        contractNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }

        optionButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
            $0.height.width.equalTo(18)
        }
    }

    // MARK: Data binding
    func setCellData(data: Contract) {
        contractNameLabel.text = "근로계약서\(data.id + 1)"
    }

    // MARK: Event
    private func addButtonEvent() {
        optionButton.addTarget(self, action: #selector(handleOptionButton), for: .touchUpInside)
    }

    @objc
    private func handleOptionButton() {
        tapOption?()
    }
}
