//
//  CalendarBottomView.swift
//  Albaid
//
//  Created by 박지윤 on 10/4/24.
//

import UIKit

final class CalendarBottomView: BaseView {

    // MARK: UI Components
    private let todayLabel = UILabel().then {
        $0.text = "오늘의 알바"
        $0.textColor = .albaidGray20
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
    }

    public lazy var todayCardCollectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout
        )

        return collectionView
    }()

    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        return layout
    }()

    // MARK: Properties
    var tapOption: (() -> Void)?
    var contract: [Contract] = []
    var todayContract: [Contract] = []

    // MARK: Configuration
    override func configureSubviews() {
        backgroundColor = .albaidGray100
        layer.cornerRadius = 12

        addSubview(todayLabel)
        addSubview(todayCardCollectionView)
    }

    // MARK: Layout
    override func makeConstraints() {
        todayLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(20)
        }

        todayCardCollectionView.snp.makeConstraints {
            $0.top.equalTo(todayLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(5)
        }
    }

    // MARK: Data binding
    func setData(data: [Contract]) {
        contract = data
        getTodayContract()
    }

    func getTodayWeekday() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "E"
        return dateFormatter.string(from: Date())
    }

    func getTodayContract() {
        let todayWeekday = getTodayWeekday()

        todayContract = contract.filter { contract in
            contract.workingDays.contains(todayWeekday)
        }

        setCollectionView()
    }
}

extension CalendarBottomView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setCollectionView() {
        todayCardCollectionView.dataSource = self
        todayCardCollectionView.delegate = self
        todayCardCollectionView.register(TodayCardCollectionViewCell.self, forCellWithReuseIdentifier: TodayCardCollectionViewCell.identifier)
        todayCardCollectionView.isScrollEnabled = false
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todayContract.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TodayCardCollectionViewCell.identifier,
            for: indexPath) as? TodayCardCollectionViewCell else { return UICollectionViewCell() }

        cell.tapOption = self.tapOption
        cell.setData(data: todayContract[indexPath.row])

        if !todayContract.isEmpty {
            if indexPath.row == todayContract.count - 1 {
                cell.dividerView.isHidden = true
            }
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 80, height: 70)
    }
}
