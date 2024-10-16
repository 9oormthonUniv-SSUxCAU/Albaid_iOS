//
//  ResumeView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ResumeView: BaseView {
    
    // MARK: UI Components
    private(set) var contractNumberLabel = UILabel().then {
        $0.textColor = .albaidGray30
        $0.font = UIFont(name: "Pretendard-Medium", size: 16)
    }

    public lazy var resumeCollectionView: UICollectionView = {
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
    var tapOption: (() -> Void)?
    var resume: [ResumeList]?

    // MARK: Configuration
    override func configureSubviews() {
        setCollectionView()
        backgroundColor = .albaidGray95

        addSubview(contractNumberLabel)
        addSubview(resumeCollectionView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        contractNumberLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(126)
            $0.leading.equalToSuperview().inset(20)
        }

        resumeCollectionView.snp.makeConstraints {
            $0.top.equalTo(contractNumberLabel.snp.bottom).offset(20)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

    // MARK: Data binding
    func setViewData(data: [ResumeList]) {
        resume = data
        contractNumberLabel.text = "총 \(data.count)건"
    }
}

extension ResumeView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setCollectionView() {
        resumeCollectionView.dataSource = self
        resumeCollectionView.delegate = self
        resumeCollectionView.register(ResumeCollectionViewCell.self, forCellWithReuseIdentifier: ResumeCollectionViewCell.identifier)
        resumeCollectionView.isPagingEnabled = false
        resumeCollectionView.showsVerticalScrollIndicator = false
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resume?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ResumeCollectionViewCell.identifier,
            for: indexPath) as? ResumeCollectionViewCell else { return UICollectionViewCell() }

        if let resume = resume?[indexPath.row] {
            cell.setCellData(data: resume)
        }
        cell.tapOption = self.tapOption

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 175)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tapCell?(indexPath.row)
    }
}
