//
//  CardCollectionView.swift
//  Albaid
//
//  Created by 박지윤 on 9/30/24.
//

import UIKit

final class CardCollectionView: BaseView {

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

        return layout
    }()

    // MARK: Properties
    var tapCell: ((Int) -> Void)?
    var tapGuide: (() -> Void)?
    var contract: [Contract]?

    // MARK: Configuration
    override func configureSubviews() {
        setCollectionView()

        addSubview(cardCollectionView)
    }

    // MARK: Layout
    override func makeConstraints() {
        cardCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func setData(data: [Contract]) {
        contract = data
    }
}

extension CardCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setCollectionView() {
        cardCollectionView.dataSource = self
        cardCollectionView.delegate = self
        cardCollectionView.register(CardCollectionViewCell.self,
                                    forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        cardCollectionView.register(CardCollectionViewHeader.self,
                                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                    withReuseIdentifier: CardCollectionViewHeader.identifier)
        cardCollectionView.isPagingEnabled = false
        cardCollectionView.showsVerticalScrollIndicator = false
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: dummy data
        return (contract?.count ?? 0) + 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CardCollectionViewCell.identifier,
            for: indexPath) as? CardCollectionViewCell else { return UICollectionViewCell() }

        // TODO: dummy data
        if indexPath.row != contract?.count {
            if let contract = contract?[indexPath.row] {
                cell.setData(data: contract)
            }
        } else {
            cell.setAddCardCell()
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 28, left: 20, bottom: 25, right: 20)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 172)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tapCell?(indexPath.row)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        return CGSize(width: screenWidth - 40, height: 187)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            if kind == UICollectionView.elementKindSectionHeader {
                guard let header = cardCollectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: CardCollectionViewHeader.identifier,
                    for: indexPath) as? CardCollectionViewHeader else { return UICollectionReusableView() }

                header.tapGuide = self.tapGuide

                return header
            } else {
                return UICollectionReusableView()
            }
        }
}
