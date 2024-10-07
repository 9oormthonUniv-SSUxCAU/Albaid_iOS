//
//  ResumeAddView.swift
//  Albaid
//
//  Created by 박지윤 on 10/7/24.
//

import UIKit

final class ResumeAddView: BaseView {

    // MARK: UI Components
    private let closeButton = BaseButton().then {
        $0.setImage(AlbaidButton.close.withTintColor(.albaidGray30), for: .normal)
    }

    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }

    private let entireView = UIView().then {
        $0.backgroundColor = .albaidGray95
    }

    private(set) var dateLabel = UILabel().then {
        $0.textColor = .albaidGray60
        $0.font = UIFont(name: "Pretendard-Regular", size: 13)
    }

    private(set) var titleLabel = UIStackView().then {
        $0.setResumeTitle(title: "제목", isEssential: true, size: 18)
    }

    private(set) var titleTextField = UITextField().then {
        $0.placeholder = "이력서 제목을 입력해 주세요"
        $0.backgroundColor = .albaidGray100
        $0.layer.cornerRadius = 12
        $0.addLeftPadding()
        $0.customPlaceholder()
    }

    private(set) var dividerView1 = DividerView(dividerType: .thin)

    private(set) var summaryLabel = UIStackView().then {
        $0.setResumeTitle(title: "간단 소개글", isEssential: true, size: 18)
    }

    private(set) var summaryTextView = UITextView().then {
        $0.backgroundColor = .albaidGray100
        $0.layer.cornerRadius = 12
    }

    private(set) var dividerView2 = DividerView(dividerType: .thin)

    private(set) var phoneStackView = UIStackView().then {
        $0.setResumeTitleWithTextField(title: "휴대폰",
                                       isEssential: true,
                                       placeholder: "010-0000-0000")
    }

    private(set) var addressStackView = UIStackView().then {
        $0.setResumeTitleWithTextField(title: "주소",
                                       isEssential: true,
                                       placeholder: "주소를 입력해 주세요")
    }

    private(set) var emailStackView = UIStackView().then {
        $0.setResumeTitleWithTextField(title: "이메일",
                                       isEssential: false,
                                       placeholder: "albaid@email.com")
    }

    private(set) var dividerView3 = DividerView(dividerType: .thin)

    private(set) var educationStackView = UIStackView().then {
        $0.setResumeTitleWithTextField(title: "최종학력",
                                       isEssential: true,
                                       placeholder: "학력을 선택해주세요")
    }

    private(set) var careerStackView = UIStackView().then {
        $0.setResumeTitleWithTextField(title: "경력",
                                       isEssential: true,
                                       placeholder: "년 / 월 / 일")
    }

    private(set) var certificationStackView = UIStackView().then {
        $0.setResumeTitleWithTextField(title: "자격•능력",
                                       isEssential: false,
                                       placeholder: "자격증이나 능력을 입력해 주세요")
    }

    private(set) var dividerView4 = DividerView(dividerType: .thin)

    private(set) var desiredLocationStackView = UIStackView().then {
        $0.setResumeTitleWithTextField(title: "희망지역",
                                       isEssential: true,
                                       placeholder: "ex. 서울 강남구")
    }

    private(set) var desiredJobStackView = UIStackView().then {
        $0.setResumeTitleWithTextField(title: "희망직종",
                                       isEssential: true,
                                       placeholder: "ex. 카페")
    }

    private(set) var dividerView5 = DividerView(dividerType: .thin)

    private(set) var careerLabel = UIStackView().then {
        $0.setResumeTitle(title: "경력사항", isEssential: true, size: 18)
    }

    private(set) var careerDurationLabel = UILabel().then {
        $0.text = "2년 3개월 11일"
        $0.textColor = .albaidGray60
        $0.font = UIFont(name: "Pretendard-Regular", size: 13)
    }

    // TODO: fix
    private(set) var addCareerButton = BaseButton().then {
        $0.setAddButton(title: "직접 추가하기")
        $0.setBorder70()
    }

    private(set) var nonScrollView = UIView()

    private(set) var addResumeButton = BaseButton().then {
        $0.setTextButton(title: "이력서 추가하기", titleColor: .albaidGray100, backgroundColor: .albaidGray20)
    }

    // MARK: Properties
    var tapClose: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        setData()
        addButtonEvent()

        addSubview(closeButton)
        addSubview(scrollView)
        scrollView.addSubview(entireView)

        entireView.addSubview(dateLabel)
        entireView.addSubview(titleLabel)
        entireView.addSubview(titleTextField)

        entireView.addSubview(dividerView1)
        entireView.addSubview(summaryLabel)
        entireView.addSubview(summaryTextView)

        entireView.addSubview(dividerView2)
        entireView.addSubview(phoneStackView)
        entireView.addSubview(addressStackView)
        entireView.addSubview(emailStackView)

        entireView.addSubview(dividerView3)
        entireView.addSubview(educationStackView)
        entireView.addSubview(careerStackView)
        entireView.addSubview(certificationStackView)

        entireView.addSubview(dividerView4)
        entireView.addSubview(desiredLocationStackView)
        entireView.addSubview(desiredJobStackView)

        entireView.addSubview(dividerView5)
        entireView.addSubview(careerLabel)
        entireView.addSubview(careerDurationLabel)
        entireView.addSubview(addCareerButton)

        addSubview(nonScrollView)
        nonScrollView.addSubview(addResumeButton)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        closeButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(6)
            $0.trailing.equalTo(safeAreaLayoutGuide).inset(16)
        }

        scrollView.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp.bottom).offset(5)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(121)
        }

        entireView.snp.makeConstraints {
            $0.verticalEdges.width.equalToSuperview()
        }

        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(23)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        titleTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.horizontalEdges.width.equalToSuperview().inset(20)
            $0.height.equalTo(48)
        }

        dividerView1.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(25)
            $0.horizontalEdges.width.equalToSuperview().inset(20)
        }

        summaryLabel.snp.makeConstraints {
            $0.top.equalTo(dividerView1.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        summaryTextView.snp.makeConstraints {
            $0.top.equalTo(summaryLabel.snp.bottom).offset(10)
            $0.horizontalEdges.width.equalToSuperview().inset(20)
            $0.height.equalTo(97)
        }

        dividerView2.snp.makeConstraints {
            $0.top.equalTo(summaryTextView.snp.bottom).offset(25)
            $0.horizontalEdges.width.equalToSuperview().inset(20)
        }

        phoneStackView.snp.makeConstraints {
            $0.top.equalTo(dividerView2.snp.bottom).offset(25)
            $0.horizontalEdges.width.equalToSuperview().inset(20)
        }

        addressStackView.snp.makeConstraints {
            $0.top.equalTo(phoneStackView.snp.bottom).offset(15)
            $0.horizontalEdges.width.equalToSuperview().inset(20)
        }

        emailStackView.snp.makeConstraints {
            $0.top.equalTo(addressStackView.snp.bottom).offset(15)
            $0.horizontalEdges.width.equalToSuperview().inset(20)
        }

        dividerView3.snp.makeConstraints {
            $0.top.equalTo(emailStackView.snp.bottom).offset(25)
            $0.horizontalEdges.width.equalToSuperview().inset(20)
        }

        educationStackView.snp.makeConstraints {
            $0.top.equalTo(dividerView3.snp.bottom).offset(25)
            $0.horizontalEdges.width.equalToSuperview().inset(20)
        }

        careerStackView.snp.makeConstraints {
            $0.top.equalTo(educationStackView.snp.bottom).offset(15)
            $0.horizontalEdges.width.equalToSuperview().inset(20)
        }

        certificationStackView.snp.makeConstraints {
            $0.top.equalTo(careerStackView.snp.bottom).offset(15)
            $0.horizontalEdges.width.equalToSuperview().inset(20)
        }

        dividerView4.snp.makeConstraints {
            $0.top.equalTo(certificationStackView.snp.bottom).offset(25)
            $0.horizontalEdges.width.equalToSuperview().inset(20)
        }

        desiredLocationStackView.snp.makeConstraints {
            $0.top.equalTo(dividerView4.snp.bottom).offset(25)
            $0.horizontalEdges.width.equalToSuperview().inset(20)
        }

        desiredJobStackView.snp.makeConstraints {
            $0.top.equalTo(desiredLocationStackView.snp.bottom).offset(15)
            $0.horizontalEdges.width.equalToSuperview().inset(20)
        }

        dividerView5.snp.makeConstraints {
            $0.top.equalTo(desiredJobStackView.snp.bottom).offset(15)
            $0.horizontalEdges.width.equalToSuperview().inset(20)
        }

        careerLabel.snp.makeConstraints {
            $0.top.equalTo(dividerView5.snp.bottom).offset(30)
            $0.horizontalEdges.width.equalToSuperview().inset(20)
        }

        careerDurationLabel.snp.makeConstraints {
            $0.top.equalTo(careerLabel.snp.bottom).offset(5)
            $0.horizontalEdges.width.equalToSuperview().inset(20)
        }

        addCareerButton.snp.makeConstraints {
            $0.top.equalTo(careerDurationLabel.snp.bottom).offset(15)
            $0.horizontalEdges.width.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(25)
        }

        nonScrollView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.bottom)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }

        addResumeButton.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview().inset(20)
        }
    }

    func setData() {
        dateLabel.text = "2024.09.22"
    }

    // MARK: Event
    private func addButtonEvent() {
        closeButton.addTarget(self, action: #selector(handleCloseButton), for: .touchUpInside)
    }

    @objc
    private func handleCloseButton() {
        tapClose?()
    }
}
