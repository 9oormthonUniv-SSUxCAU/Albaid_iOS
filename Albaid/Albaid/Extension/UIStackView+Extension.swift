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

    func contractGuideLabelStackView(title: String, content: String) {
        axis = .horizontal
        distribution = .fill

        let titleLabel = UILabel().then {
            $0.setContractTitleLabel(title: title)
        }
        let emptyView = UIView()
        let contentLabel = UILabel().then {
            $0.setContractPlaceHolderLabel(content: content)
        }

        addArrangedSubviews(titleLabel, emptyView, contentLabel)
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

    func resumeLabelStackView(title: String, content: String) {
        spacing = 11
        axis = .horizontal
        distribution = .fill

        let titleLabel = UILabel().then {
            $0.setResumeTitleLabel(title: title)
        }
        let dividerView = UIView().then {
            $0.backgroundColor = .albaidGray70
        }
        let contentLabel = UILabel().then {
            $0.setResumeContentLabel(content: content)
        }
        let emptyView = UIView()

        dividerView.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(11)
        }

        addArrangedSubviews(titleLabel, dividerView, contentLabel, emptyView)
    }

    func resumeDetailStackView(title: String, content: String) {
        spacing = 0
        axis = .horizontal
        distribution = .fill

        let titleLabel = UILabel().then {
            $0.setContractTitleLabel(title: title)
        }

        let contentLabel = UILabel().then {
            $0.setResumeDetailContentLabel(content: content)
        }
        let emptyView = UIView()

        titleLabel.snp.makeConstraints {
            $0.width.equalTo(100)
        }

        addArrangedSubviews(titleLabel, contentLabel, emptyView)
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
