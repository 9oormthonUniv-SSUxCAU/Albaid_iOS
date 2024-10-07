//
//  TodayCardCollectionViewCell.swift
//  Albaid
//
//  Created by 박지윤 on 10/4/24.
//

import UIKit

final class TodayCardCollectionViewCell: UICollectionViewCell {

    static let identifier = "TodayCardCollectionViewCell"

    // MARK: UI Components
    private(set) var colorView = UIView().then {
        $0.layer.cornerRadius = 2
    }

    private let labelStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 3
    }

    private(set) var titleLabel = UILabel().then {
        $0.textColor = .albaidGray30
        $0.font = UIFont(name: "Pretendard-Medium", size: 15)
    }

    private(set) var timeLabel = UILabel().then {
        $0.textColor = .albaidGray50
        $0.font = UIFont(name: "Pretendard-Regular", size: 12)
    }

    private(set) var optionButton = BaseButton().then {
        $0.setImage(AlbaidButton.more.withTintColor(.albaidGray50), for: .normal)
    }

    private(set) var dividerView = DividerView(dividerType: .thin)

    // MARK: Properties
    var tapOption: (() -> Void)?

    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureSubviews()
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configuration
    private func configureSubviews() {
        addButtonEvent()

        contentView.addSubview(colorView)
        contentView.addSubview(labelStackView)
        labelStackView.addArrangedSubviews(titleLabel, timeLabel)
        contentView.addSubview(optionButton)
        contentView.addSubview(dividerView)
    }

    // MARK: Layout
    private func makeConstraints() {
        colorView.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview()
            $0.height.width.equalTo(10)
        }

        labelStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(colorView.snp.trailing).offset(10)
        }

        optionButton.snp.makeConstraints {
            $0.trailing.centerY.equalToSuperview()
            $0.height.width.equalTo(24)
        }

        dividerView.snp.makeConstraints {
            $0.bottom.horizontalEdges.equalToSuperview()
        }
    }

    func setData(data: Contract) {
        var color: UIColor

        switch (data.id + 1) % 3 {
        case 0:
            color = .albaidSubPink
        case 1:
            color = .albaidMainGreen
        case 2:
            color = .albaidSubBlue
        default:
            color = .albaidMainGreen
        }

        colorView.backgroundColor = color
        titleLabel.text = "알바 카드\(data.id + 1)"
        timeLabel.text = data.standardWorkingStartTime.toTimeString() + " - " + data.standardWorkingEndTime.toTimeString()

        // TODO: Fix
        optionButton.isHidden = true
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

