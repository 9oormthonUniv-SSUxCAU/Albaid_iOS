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

    func contractStackView(title: String, content: String) {
        axis = .horizontal
        distribution = .fill

        let titleLabel = UILabel().then {
            $0.setContractTitleLabel(title: title)
        }
        let emptyView = UIView()
        let contentTextField = UITextField().then {
            $0.setContractText(content: content)
        }

        addArrangedSubviews(titleLabel, emptyView, contentTextField)
    }

    func contractInputStackView(title: String, content: String) {
        axis = .horizontal
        distribution = .fill

        let titleLabel = UILabel().then {
            $0.setContractTitleLabel(title: title)
        }
        let emptyView = UIView()
        let contentTextField = UITextField().then {
            $0.setContractPlaceholder(content: content)
        }

        addArrangedSubviews(titleLabel, emptyView, contentTextField)
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

    func setResumeTitle(title: String, isEssential: Bool, size: Int) {
        axis = .horizontal
        spacing = 1

        let titleLabel = UILabel().then {
            $0.text = title
            $0.textColor = .albaidGray20
            $0.font = UIFont(name: "Pretendard-SemiBold", size: CGFloat(size))
        }

        let isEssentialLabel = UILabel().then {
            $0.text = "*"
            $0.textColor = .albaidSubPink
            $0.font = UIFont(name: "Pretendard-SemiBold", size: CGFloat(size))
        }

        let emptyView = UIView()

        if isEssential {
            addArrangedSubviews(titleLabel,
                                isEssentialLabel,
                                emptyView)
        } else {
            addArrangedSubviews(titleLabel)
        }
    }

    func setResumeSubTitle(title: String, isEssential: Bool) {
        axis = .horizontal
        spacing = 1

        let titleLabel = UILabel().then {
            $0.text = title
            $0.textColor = .albaidGray20
            $0.font = UIFont(name: "Pretendard-Medium", size: 16)
        }

        let isEssentialLabel = UILabel().then {
            $0.text = "*"
            $0.textColor = .albaidSubPink
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        }

        let emptyView = UIView()

        if isEssential {
            addArrangedSubviews(titleLabel,
                                isEssentialLabel,
                                emptyView)
        } else {
            addArrangedSubviews(titleLabel)
        }

        snp.makeConstraints {
            $0.width.equalTo(80)
        }
    }

    func setResumeTitleWithTextField(title: String,
                                     isEssential: Bool,
                                     placeholder: String) {
        axis = .horizontal
        spacing = 20

        let resumeSubTitleStackView = UIStackView().then {
            $0.setResumeSubTitle(title: title, isEssential: isEssential)
        }

        let resumeTextField = UITextField().then {
            $0.placeholder = placeholder
            $0.backgroundColor = .albaidGray100
            $0.layer.cornerRadius = 12
            $0.addLeftPadding()
            $0.customPlaceholder()
        }

        resumeTextField.snp.makeConstraints {
            $0.height.equalTo(47)
        }

        snp.makeConstraints {
            $0.height.equalTo(47)
        }

        addArrangedSubviews(resumeSubTitleStackView,
                            resumeTextField)
    }
}
