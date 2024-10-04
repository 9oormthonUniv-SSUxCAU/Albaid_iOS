//
//  CalendarWeeklyView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class CalendarWeeklyView: BaseView {

    // MARK: UI Components
    public lazy var cardCollectionView: UICollectionView = {
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
    var tapCell: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        backgroundColor = .albaidGray95

        setCollectionView()

        addSubview(cardCollectionView)
    }

    // MARK: Layout
    override func makeConstraints() {
        cardCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func setData(data: User) {
    }
}

extension CalendarWeeklyView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setCollectionView() {
        cardCollectionView.dataSource = self
        cardCollectionView.delegate = self
        cardCollectionView.register(CalendarWeeklyViewCell.self, forCellWithReuseIdentifier: CalendarWeeklyViewCell.identifier)
        cardCollectionView.isPagingEnabled = false
        cardCollectionView.showsHorizontalScrollIndicator = false
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CalendarWeeklyViewCell.identifier,
            for: indexPath) as? CalendarWeeklyViewCell else { return UICollectionViewCell() }

        if indexPath.row != 0 {
            cell.dayTextLabel.isHidden = true
            cell.dayLabel.isHidden = true
        }

        cell.setData(data: User.dummyUser.card?[indexPath.row])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 65)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tapCell?()
    }
}
