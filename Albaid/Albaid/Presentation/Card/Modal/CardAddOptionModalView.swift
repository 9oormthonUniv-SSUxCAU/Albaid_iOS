//
//  CardAddOptionModalView.swift
//  Albaid
//
//  Created by 박지윤 on 10/7/24.
//

import UIKit

final class CardAddOptionModalView: BaseView {
    
    // MARK: UI Components
    private(set) var modalDividerView = UIView().then {
        $0.backgroundColor = .albaidGray70
        $0.layer.cornerRadius = 3
    }

    private(set) var optionStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 30
    }

    private(set) var cameraOptionView = CardAddOptionView(description: AlbaidString.addCardDescription1,
                                                          title: AlbaidString.addCardTitle1)
    private(set) var contractOptionView = CardAddOptionView(description: AlbaidString.addCardDescription2,
                                                          title: AlbaidString.addCardTitle2)
    private(set) var galleryOptionView = CardAddOptionView(description: AlbaidString.addCardDescription3,
                                                          title: AlbaidString.addCardTitle3)

    // MARK: Properties

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(modalDividerView)
        addSubview(optionStackView)

        optionStackView.addArrangedSubviews(cameraOptionView,
                                            contractOptionView,
                                            galleryOptionView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        modalDividerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(38)
            $0.height.equalTo(6)
        }
    
        optionStackView.snp.makeConstraints {
            $0.top.equalTo(modalDividerView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(25)
        }
    }
}
