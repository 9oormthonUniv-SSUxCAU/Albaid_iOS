//
//  ContractCollectionView.swift
//  Albaid
//
//  Created by 박지윤 on 9/29/24.
//

import UIKit

final class ContractCollectionView: BaseView {
    
    // MARK: UI Components
    private(set) var contractNumberLabel = UILabel().then {
        $0.textColor = .albaidGray30
        $0.font = UIFont(name: "Pretendard-Medium", size: 16)
    }

    public lazy var contractCollectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout
        )
        collectionView.backgroundColor = .clear

        return collectionView
    }()

    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        return layout
    }()

    // MARK: Properties
    var tapCell: ((Int) -> Void)?
    var tapOption: ((Int) -> Void)?
    var contract: [ContractGet]?

    // MARK: Configuration
    override func configureSubviews() {
        setCollectionView()

        addSubview(contractNumberLabel)
        addSubview(contractCollectionView)

        backgroundColor = .albaidGray95
    }
    
    // MARK: Layout
    override func makeConstraints() {
        contractNumberLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(20)
        }

        contractCollectionView.snp.makeConstraints {
            $0.top.equalTo(contractNumberLabel.snp.bottom).offset(20)
            $0.width.bottom.equalToSuperview()
        }
    }

    // MARK: Data binding
    func setData(data: [ContractGet]) {
        contract = data
        contractNumberLabel.text = "총 \(data.count)건"
    }
}

extension ContractCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setCollectionView() {
        contractCollectionView.dataSource = self
        contractCollectionView.delegate = self
        contractCollectionView.register(ContractCollectionViewCell.self, forCellWithReuseIdentifier: ContractCollectionViewCell.identifier)
        contractCollectionView.isPagingEnabled = false
        contractCollectionView.showsVerticalScrollIndicator = false
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contract?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ContractCollectionViewCell.identifier,
            for: indexPath) as? ContractCollectionViewCell else { return UICollectionViewCell() }

        // TODO: dummy data
        if let contract = contract?[indexPath.row] {
            cell.setCellData(data: contract)
        }

        cell.index = indexPath.row
        cell.tapOption = { [weak self] index in
            guard let self = self else { return }
            self.tapOption?(index)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 11
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (UIScreen.main.bounds.width - 40 - 11)/2
        return CGSize(width: itemWidth, height: 150)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tapCell?(indexPath.row)
    }
}
