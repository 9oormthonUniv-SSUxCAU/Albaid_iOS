//
//  ResumeDetailView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//


import UIKit

final class ResumeDetailView: BaseView {
    
    // MARK: UI Components
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }

    private let entireView = UIView()

    private(set) var dateLabel = UILabel().then {
        $0.text = "2024.09.22"
        $0.textColor = .albaidGray60
        $0.font = UIFont(name: "Pretendard-Regular", size: 13)
    }

    private(set) var titleLabel = UILabel().then {
        $0.text = "[기본] 김알바1"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 20)
    }

    private(set) var dividerView1 = DividerView(dividerType: .thin)

    private(set) var infoLabel = UILabel().then {
        $0.text = "간단 소개글"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
    }

    private(set) var infoContentLabel = UILabel().then {
        $0.text = "안녕하세요. 성실한 알바생 김알바입니다."
        $0.textColor = .albaidGray30
        $0.font = UIFont(name: "Pretendard-Regular", size: 15)
    }

    private(set) var dividerView2 = DividerView(dividerType: .thin)

    private(set) var phoneStackView = UIStackView().then {
        $0.resumeDetailStackView(title: "휴대폰", content: "010-1234-5678")
    }

    private(set) var addressStackView = UIStackView().then {
        $0.resumeDetailStackView(title: "주소", content: "경기도 수원시 영통구")
    }

    private(set) var emailStackView = UIStackView().then {
        $0.resumeDetailStackView(title: "이메일", content: "albaid@email.com")
    }

    private(set) var dividerView3 = DividerView(dividerType: .thin)

    private(set) var educationStackView = UIStackView().then {
        $0.resumeDetailStackView(title: "최종학력", content: "대학(4년제)")
    }

    private(set) var careerStackView = UIStackView().then {
        $0.resumeDetailStackView(title: "경력", content: "2년 1개월 16일")
    }

    private(set) var certificateStackView = UIStackView().then {
        $0.resumeDetailStackView(title: "자격 • 능력", content: "자격증 1")
    }

    private(set) var dividerView4 = DividerView(dividerType: .thin)

    private(set) var careerLabel = UILabel().then {
        $0.text = "경력사항"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 20)
    }

    private(set) var careerContentLabel = UILabel().then {
        $0.text = "2년 3개월 11일"
        $0.textColor = .albaidGray60
        $0.font = UIFont(name: "Pretendard-Regular", size: 13)
    }

    private(set) var careerListStackView = CareerListStackView()

    // MARK: Properties

    // MARK: Configuration
    override func configureSubviews() {
        backgroundColor = .albaidGray95
        setCareerListStackView()

        addSubview(scrollView)
        scrollView.addSubview(entireView)

        entireView.addSubview(dateLabel)
        entireView.addSubview(titleLabel)
        entireView.addSubview(dividerView1)
        entireView.addSubview(infoLabel)
        entireView.addSubview(infoContentLabel)
        entireView.addSubview(dividerView2)

        entireView.addSubview(phoneStackView)
        entireView.addSubview(addressStackView)
        entireView.addSubview(emailStackView)
        entireView.addSubview(dividerView3)

        entireView.addSubview(educationStackView)
        entireView.addSubview(careerStackView)
        entireView.addSubview(certificateStackView)
        entireView.addSubview(dividerView4)

        entireView.addSubview(careerLabel)
        entireView.addSubview(careerContentLabel)

        entireView.addSubview(careerListStackView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        entireView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        dateLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(20)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(20)
        }

        dividerView1.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
        }

        infoLabel.snp.makeConstraints {
            $0.top.equalTo(dividerView1.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
        }

        infoContentLabel.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(20)
        }

        dividerView2.snp.makeConstraints {
            $0.top.equalTo(infoContentLabel.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview()
        }
    
        phoneStackView.snp.makeConstraints {
            $0.top.equalTo(dividerView2.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
        }

        addressStackView.snp.makeConstraints {
            $0.top.equalTo(phoneStackView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
        }

        emailStackView.snp.makeConstraints {
            $0.top.equalTo(addressStackView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
        }

        dividerView3.snp.makeConstraints {
            $0.top.equalTo(emailStackView.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview()
        }

        educationStackView.snp.makeConstraints {
            $0.top.equalTo(dividerView3.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
        }

        careerStackView.snp.makeConstraints {
            $0.top.equalTo(educationStackView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
        }

        certificateStackView.snp.makeConstraints {
            $0.top.equalTo(careerStackView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
        }

        dividerView4.snp.makeConstraints {
            $0.top.equalTo(certificateStackView.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview()
        }

        careerLabel.snp.makeConstraints {
            $0.top.equalTo(dividerView4.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
        }

        careerContentLabel.snp.makeConstraints {
            $0.top.equalTo(careerLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().inset(20)
        }

        careerListStackView.snp.makeConstraints {
            $0.top.equalTo(careerContentLabel.snp.bottom).offset(7)
            $0.height.equalTo(327)
            $0.leading.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(40)
        }
    }

    private func setCareerListStackView() {
        careerListStackView.setData()
    }
}
