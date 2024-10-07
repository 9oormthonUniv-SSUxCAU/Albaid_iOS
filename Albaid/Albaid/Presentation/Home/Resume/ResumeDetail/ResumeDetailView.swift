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
        $0.textColor = .albaidGray60
        $0.font = UIFont(name: "Pretendard-Regular", size: 13)
    }

    private(set) var titleLabel = UILabel().then {
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 20)
    }

    private(set) var dividerView1 = DividerView(dividerType: .thin)

    private(set) var summaryLabel = UILabel().then {
        $0.text = "간단 소개글"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
    }

    private(set) var summaryContentLabel = UILabel().then {
        $0.textColor = .albaidGray30
        $0.font = UIFont(name: "Pretendard-Regular", size: 15)
    }

    private(set) var dividerView2 = DividerView(dividerType: .thin)

    private(set) var phoneStackView = UIStackView()
    private(set) var addressStackView = UIStackView()
    private(set) var emailStackView = UIStackView()

    private(set) var dividerView3 = DividerView(dividerType: .thin)

    private(set) var educationStackView = UIStackView()
    private(set) var careerStackView = UIStackView()
    private(set) var certificateStackView = UIStackView()
    private(set) var dividerView4 = DividerView(dividerType: .thin)

    private(set) var careerLabel = UILabel().then {
        $0.text = "경력사항"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 20)
    }

    private(set) var careerContentLabel = UILabel().then {
        $0.textColor = .albaidGray60
        $0.font = UIFont(name: "Pretendard-Regular", size: 13)
    }

    private(set) var careerListStackView = CareerListStackView()

    // MARK: Properties
    var careers: [Career] = []

    // MARK: Configuration
    override func configureSubviews() {
        backgroundColor = .albaidGray95

        addSubview(scrollView)
        scrollView.addSubview(entireView)

        entireView.addSubview(dateLabel)
        entireView.addSubview(titleLabel)
        entireView.addSubview(dividerView1)
        entireView.addSubview(summaryLabel)
        entireView.addSubview(summaryContentLabel)
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
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        summaryLabel.snp.makeConstraints {
            $0.top.equalTo(dividerView1.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
        }

        summaryContentLabel.snp.makeConstraints {
            $0.top.equalTo(summaryLabel.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(20)
        }

        dividerView2.snp.makeConstraints {
            $0.top.equalTo(summaryContentLabel.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
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
            $0.horizontalEdges.equalToSuperview().inset(20)
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
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        careerLabel.snp.makeConstraints {
            $0.top.equalTo(dividerView4.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
        }

        careerContentLabel.snp.makeConstraints {
            $0.top.equalTo(careerLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().inset(20)
        }
    }

    func setCareerListStackView() {
        careerListStackView.setData()
    }

    // MARK: Data binding
    func setViewData(data: Resume) {
        // TODO: fix
        dateLabel.text = "2024.09.22"
        titleLabel.text = data.title
        summaryContentLabel.text = data.summary

        phoneStackView.resumeDetailStackView(title: "휴대폰", content: data.phone)
        addressStackView.resumeDetailStackView(title: "주소", content: data.address)
        emailStackView.resumeDetailStackView(title: "이메일", content: data.email)

        educationStackView.resumeDetailStackView(title: "최종학력", content: data.finalEducation)
        careerStackView.resumeDetailStackView(title: "경력", content: data.totalCareerDuration)
        // TODO: fix
        certificateStackView.resumeDetailStackView(title: "자격 • 능력", content: "자격증 1")

        // TODO: fix
        careerContentLabel.text = "2년 3개월 11일"

        careers = data.careers

        let cellHeight = 94
        let cellCount = careers.count
        let spacing = 15
        print(cellCount)

        careerListStackView.snp.makeConstraints {
            $0.top.equalTo(careerContentLabel.snp.bottom).offset(7)
            $0.height.equalTo(cellHeight * cellCount + spacing * (cellCount - 1))
            $0.leading.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(40)
        }
    }
}
