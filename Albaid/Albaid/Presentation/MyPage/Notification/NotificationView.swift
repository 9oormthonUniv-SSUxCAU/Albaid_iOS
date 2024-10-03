//
//  NotificationView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class NotificationView: BaseView {

    // MARK: UI Components
    public lazy var notificationCollectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout
        )

        return collectionView
    }()

    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()

        return layout
    }()

    // MARK: Properties
    var tapCell: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        setCollectionView()

        addSubview(notificationCollectionView)
    }

    // MARK: Layout
    override func makeConstraints() {
        notificationCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension NotificationView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setCollectionView() {
        notificationCollectionView.dataSource = self
        notificationCollectionView.delegate = self
        notificationCollectionView.register(NotificationCollectionViewCell.self,
                                      forCellWithReuseIdentifier: NotificationCollectionViewCell.identifier)
        notificationCollectionView.isPagingEnabled = false
        notificationCollectionView.showsVerticalScrollIndicator = false
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: NotificationCollectionViewCell.identifier,
            for: indexPath) as? NotificationCollectionViewCell else { return UICollectionViewCell() }
        if indexPath.row == 1 {
            cell.dividerView.removeFromSuperview()
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tapCell?()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 88)
    }
}
