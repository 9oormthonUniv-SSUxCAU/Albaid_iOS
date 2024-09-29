//
//  ResumeCollectionViewCell.swift
//  Albaid
//
//  Created by 박지윤 on 9/30/24.
//

import UIKit

final class ResumeCollectionViewCell: UICollectionViewCell {

    static let identifier = "ResumeCollectionViewCell"

    // MARK: UI Components
    private(set) var certificationImageView = UIImageView().then {
        $0.image = AlbaidImage.certification
        $0.contentMode = .scaleAspectFit
    }

    private(set) var optionButton = BaseButton().then {
        $0.setImage(AlbaidButton.menu.withTintColor(.albaidGray60), for: .normal)
    }

    private(set) var resumeTitleLabel = UILabel().then {
        $0.text = "[기본] 김알바1"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
    }

    private(set) var resumeDateLabel = UILabel().then {
        $0.text = "2024.09.22"
        $0.textColor = .albaidGray60
        $0.font = UIFont(name: "Pretendard-Regular", size: 13)
    }

    private(set) var areaStackView = UIStackView().then {
        $0.resumeLabelStackView(title: "희망지역", content: "서울 강남구")
    }

    private(set) var occupationStackView = UIStackView().then {
        $0.resumeLabelStackView(title: "희망직종", content: "베이커리, 카페")
    }

    // MARK: Properties
    var tapOption: (() -> Void)?

    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureSubviews()
        makeConstraints()
        addButtonEvent()
        setContentView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configuration
    private func configureSubviews() {
        contentView.layer.cornerRadius = 16

        contentView.addSubview(certificationImageView)
        contentView.addSubview(optionButton)
        contentView.addSubview(resumeTitleLabel)
        contentView.addSubview(resumeDateLabel)
        contentView.addSubview(areaStackView)
        contentView.addSubview(occupationStackView)
    }

    // MARK: Layout
    private func makeConstraints() {
        certificationImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(26)
        }

        optionButton.snp.makeConstraints {
            $0.centerY.equalTo(certificationImageView)
            $0.trailing.equalToSuperview().inset(10)
            $0.height.width.equalTo(24)
        }

        resumeTitleLabel.snp.makeConstraints {
            $0.top.equalTo(certificationImageView.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(20)
        }

        resumeDateLabel.snp.makeConstraints {
            $0.top.equalTo(resumeTitleLabel.snp.bottom).offset(7)
            $0.leading.equalToSuperview().inset(20)
        }

        areaStackView.snp.makeConstraints {
            $0.bottom.equalTo(occupationStackView.snp.top).offset(-8)
            $0.leading.equalToSuperview().inset(20)
        }

        occupationStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
        }
    }

    private func setContentView() {
        contentView.backgroundColor = .albaidGray100
        contentView.layer.cornerRadius = 12
    }

    func setData(data: Card?) {
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
