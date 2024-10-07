//
//  HomeCardCollectionView.swift
//  Albaid
//
//  Created by 박지윤 on 9/28/24.
//

import UIKit

final class HomeCardCollectionView: BaseView {

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
        layout.scrollDirection = .horizontal

        return layout
    }()

    // MARK: Properties
    var tapCell: ((Int) -> Void)?
    var contract: [Contract]?

    // MARK: Configuration
    override func configureSubviews() {
        setCollectionView()

        addSubview(cardCollectionView)
    }

    // MARK: Layout
    override func makeConstraints() {
        cardCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(172)
            $0.width.equalToSuperview()
        }
    }

    func setData(data: [Contract]) {
        contract = data
    }
}

extension HomeCardCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setCollectionView() {
        cardCollectionView.dataSource = self
        cardCollectionView.delegate = self
        cardCollectionView.register(CardCollectionViewCell.self,
                                    forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        cardCollectionView.isPagingEnabled = false
        cardCollectionView.showsHorizontalScrollIndicator = false
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: dummy data
        return contract?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CardCollectionViewCell.identifier,
            for: indexPath) as? CardCollectionViewCell else { return UICollectionViewCell() }

        // TODO: dummy data
        if let contract = contract?[indexPath.row] {
            cell.setData(data: contract)
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 172)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tapCell?(indexPath.row)
    }
}
