//
//  UIStackView+Extension.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit.UIStackView

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }

    func contractLabelStackView(title: String, content: String) {
        axis = .horizontal
        distribution = .fill

        let titleLabel = UILabel().then {
            $0.setContractTitleLabel(title: title)
        }
        let emptyView = UIView()
        let contentLabel = UILabel().then {
            $0.setContractContentLabel(content: content)
        }

        addArrangedSubviews(titleLabel, emptyView, contentLabel)
    }

    func contractButtonStackView(title: String, content: String) {
        axis = .horizontal
        distribution = .fill
        
        let titleLabel = UILabel().then {
            $0.setContractTitleLabel(title: title)
        }
        let emptyView = UIView()
        let contentButton = BaseButton().then {
            $0.setContractButton(content: content)
        }
        
        addArrangedSubviews(titleLabel, emptyView, contentButton)
    }

    func contractIsSuccessStackView(title: String, isSuccess: UIImage) {
        axis = .horizontal
        distribution = .fill

        let titleLabel = UILabel().then {
            $0.setCheckLabel(title: title)
        }
        let emptyView = UIView()
        let isSuccessImageView = UIImageView().then {
            $0.image = isSuccess
            $0.contentMode = .scaleAspectFit
        }

        addArrangedSubviews(titleLabel, emptyView, isSuccessImageView)
    }
}
