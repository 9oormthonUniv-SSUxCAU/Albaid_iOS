//
//  MyPageCollectionViewHeader.swift
//  Albaid
//
//  Created by 박지윤 on 10/2/24.
//

import UIKit

final class MyPageCollectionViewHeader: UICollectionReusableView {

    // MARK: Properties
    static let identifier = "MyPageCollectionViewHeader"

    // MARK: UI Components
    private(set) var profileView = UIView()

    private let profileImageView = UIImageView().then {
        $0.image = AlbaidImage.profile
    }

    private let albumButton = BaseButton().then {
        $0.setImage(AlbaidButton.album, for: .normal)
    }

    private(set) var userLabel = UILabel().then {
        $0.text = "김알바"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 22)
    }

    private(set) var detailButton = UIImageView().then {
        $0.image = AlbaidButton.detail.withTintColor(.albaidGray60)
    }

    private(set) var membershipLabel = UILabel().then {
        $0.text = "무료 멤버십"
        $0.textColor = .albaidGray50
        $0.font = UIFont(name: "Pretendard-Medium", size: 16)
    }

    private let dividerView = DividerView(dividerType: .thick)

    private(set) var titleImageView = UIImageView().then {
        $0.image = AlbaidImage.user
    }

    private(set) var titleLabel = UILabel().then {
        $0.text = "MY"
        $0.textColor = .albaidGray40
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
    }

    // MARK: Properties
    var tapAlbum: (() -> Void)?

    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureSubviews()
        makeConstraints()
        addButtonEvent()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Properties

    // MARK: Configuration
    private func configureSubviews() {
        addSubview(profileView)
        profileView.addSubview(profileImageView)
        profileImageView.addSubview(albumButton)
        profileView.addSubview(userLabel)
        profileView.addSubview(detailButton)
        profileView.addSubview(membershipLabel)
        profileView.addSubview(dividerView)

        addSubview(titleImageView)
        addSubview(titleLabel)
    }

    // MARK: Layout
    private func makeConstraints() {
        profileView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(193)
        }

        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(35)
            $0.leading.equalToSuperview().inset(20)
            $0.height.width.equalTo(110)
        }

        albumButton.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview()
            $0.height.width.equalTo(40)
        }

        userLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(20)
            $0.top.equalTo(profileImageView.snp.top).inset(40)
        }

        detailButton.snp.makeConstraints {
            $0.leading.equalTo(userLabel.snp.trailing).offset(5)
            $0.centerY.equalTo(userLabel)
            $0.height.width.equalTo(24)
        }

        membershipLabel.snp.makeConstraints {
            $0.top.equalTo(userLabel.snp.bottom).offset(3)
            $0.leading.equalTo(userLabel.snp.leading)
        }

        dividerView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.horizontalEdges.equalToSuperview()
        }

        titleImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.height.width.equalTo(24)
        }

        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(titleImageView)
            $0.leading.equalTo(titleImageView.snp.trailing).offset(8)
        }
    }

    // MARK: Event
    private func addButtonEvent() {
        albumButton.addTarget(self, action: #selector(handleAlbumButton), for: .touchUpInside)
    }

    @objc
    private func handleAlbumButton() {
        tapAlbum?()
    }
}

