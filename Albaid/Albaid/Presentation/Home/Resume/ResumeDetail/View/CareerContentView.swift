//
//  CareerContentView.swift
//  Albaid
//
//  Created by 박지윤 on 9/30/24.
//

import UIKit

final class CareerContentView: BaseView {
    
    // MARK: UI Components
    private(set) var companyImageView = UIImageView().then {
        $0.image = AlbaidImage.twosome
    }

    private(set) var categoryLabel = UILabel().then {
        $0.textColor = .albaidGray60
        $0.font = UIFont(name: "Pretendard-Regular", size: 12)
    }

    private(set) var workplaceLabel = UILabel().then {
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
    }

    private(set) var calendarImageView = UIImageView().then {
        $0.image = AlbaidImage.calendar.withTintColor(.albaidGray60)
    }

    private(set) var periodLabel = UILabel().then {
        $0.textColor = .albaidGray60
        $0.font = UIFont(name: "Pretendard-Regular", size: 13)
    }

    private(set) var periodTextLabel = UILabel().then {
        $0.textColor = .albaidGray30
        $0.font = UIFont(name: "Pretendard-Regular", size: 13)
    }

    // MARK: Properties

    // MARK: Configuration
    override func configureSubviews() {
        setContentView()

        addSubview(companyImageView)
        addSubview(categoryLabel)
        addSubview(workplaceLabel)
        addSubview(calendarImageView)
        addSubview(periodLabel)
        addSubview(periodTextLabel)

    }
    
    // MARK: Layout
    override func makeConstraints() {
        self.snp.makeConstraints {
            $0.height.equalTo(94)
            $0.width.equalTo(305)
        }

        companyImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }

        categoryLabel.snp.makeConstraints {
            $0.bottom.equalTo(workplaceLabel.snp.top).offset(-5)
            $0.leading.equalTo(companyImageView.snp.trailing).offset(20)
        }

        workplaceLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(companyImageView.snp.trailing).offset(20)
        }

        calendarImageView.snp.makeConstraints {
            $0.top.equalTo(workplaceLabel.snp.bottom).offset(5)
            $0.leading.equalTo(companyImageView.snp.trailing).offset(20)
        }

        periodLabel.snp.makeConstraints {
            $0.centerY.equalTo(calendarImageView)
            $0.leading.equalTo(calendarImageView.snp.trailing).offset(5)
        }

        periodTextLabel.snp.makeConstraints {
            $0.centerY.equalTo(calendarImageView)
            $0.leading.equalTo(periodLabel.snp.trailing).offset(5)
        }
    }

    private func setContentView() {
        backgroundColor = .albaidGray100
        layer.cornerRadius = 12
    }

    // MARK: Data binding
    func setData(data: Career?) {
        // TODO: fix
        categoryLabel.text = "카페 아르바이트"
        workplaceLabel.text = data?.companyName
        let period = (data?.startDate.toDateString(format: "yy.MM") ?? "") + "~" + (data?.endDate.toDateString(format: "yy.MM") ?? "")
        periodLabel.text = period

        let calendar = Calendar.current
        let components = calendar.dateComponents([.month, .day], from: data?.startDate ?? Date(), to: data?.endDate ?? Date())
        let year = (components.month ?? 0) / 12
        let month = (components.month ?? 0) % 12
        let day = components.day

        var periodText = "\(month)개월"
        if year != 0 {
            periodText = "\(year)년 " + periodText
        }
        if day != 0 {
            periodText += " \(day ?? 0)일"
        }
        periodTextLabel.text = periodText
    }
}
