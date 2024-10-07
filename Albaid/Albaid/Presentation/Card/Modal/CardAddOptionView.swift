//
//  CardAddOptionView.swift
//  Albaid
//
//  Created by 박지윤 on 10/7/24.
//

import UIKit

final class CardAddOptionView: BaseView {
    
    // MARK: UI Components
    private(set) var descriptionLabel = UILabel().then {
        $0.text = "스캔하면 정보 요약을 자동으로"
        $0.textColor = .albaidGray50
        $0.font = UIFont(name: "Pretendard-Medium", size: 12)
    }

    private(set) var titleLabel = UILabel().then {
        $0.text = "근로계약서 촬영하기"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 20)
    }

    private(set) var detailButton = UIImageView().then {
        $0.image = AlbaidButton.detail.withTintColor(.albaidGray60)
    }

    // MARK: Properties
    var tapView: (() -> Void)?

    // MARK: Init
    init(description: String, title: String) {
        super.init(frame: .zero)

        setView(description: description, title: title)
        addViewEvent()
        configureSubviews()
        makeConstraints()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(descriptionLabel)
        addSubview(titleLabel)
        addSubview(detailButton)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        snp.makeConstraints {
            $0.height.equalTo(48)
        }

        descriptionLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
    
        titleLabel.snp.makeConstraints {
            $0.bottom.leading.equalToSuperview()
        }

        detailButton.snp.makeConstraints {
            $0.centerY.trailing.equalToSuperview()
            $0.height.width.equalTo(24)
        }
    }

    // MARK: Data binding
    private func setView(description: String, title: String) {
        descriptionLabel.text = description
        titleLabel.text = title
    }

    // MARK: Event
    private func addViewEvent() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapView(_:)))
        addGestureRecognizer(tapGesture)
        isUserInteractionEnabled = true
    }

    @objc private func handleTapView(_ sender: UITapGestureRecognizer) {
        tapView?()
    }
}
