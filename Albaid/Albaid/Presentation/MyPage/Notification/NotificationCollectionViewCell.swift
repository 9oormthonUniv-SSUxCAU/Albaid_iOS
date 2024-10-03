//
//  NotificationCollectionViewCell.swift
//  Albaid
//
//  Created by 박지윤 on 10/3/24.
//

import UIKit

final class NotificationCollectionViewCell: UICollectionViewCell {

    static let identifier = "NotificationCollectionViewCell"

    // MARK: UI Components
    private(set) var notificationImageView = UIImageView().then {
        $0.image = AlbaidImage.noti
    }

    private(set) var labelStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 5
    }

    private(set) var titleLabel = UILabel().then {
        $0.text = "내 첫 알바 카드 생성 완료"
        $0.textColor = .albaidGray50
        $0.font = UIFont(name: "Pretendard-Medium", size: 12)
    }

    private(set) var contentLabel = UILabel().then {
        $0.text = "알바 카드 탭에서 알바 정보를 확인해 보세요."
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
    }

    private(set) var timeLabel = UILabel().then {
        $0.text = "1분 전"
        $0.textColor = .albaidGray50
        $0.font = UIFont(name: "Pretendard-Regular", size: 12)
    }

    private(set) var dividerView = DividerView(dividerType: .thin)

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
        addSubview(notificationImageView)
        addSubview(labelStackView)
        labelStackView.addArrangedSubviews(titleLabel, contentLabel)

        addSubview(timeLabel)
        addSubview(dividerView)
    }

    // MARK: Layout
    private func makeConstraints() {
        notificationImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.height.width.equalTo(48)
        }

        labelStackView.snp.makeConstraints {
            $0.leading.equalTo(notificationImageView.snp.trailing).offset(15)
            $0.centerY.equalToSuperview()
        }

        timeLabel.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().inset(20)
        }

        dividerView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }

    func setData(data: Card?) {
    }
}
