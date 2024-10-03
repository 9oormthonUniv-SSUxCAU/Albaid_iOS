//
//  MyPageCollectionViewFooter.swift
//  Albaid
//
//  Created by 박지윤 on 10/2/24.
//

import UIKit

final class MyPageCollectionViewFooter: UICollectionReusableView {

    // MARK: Properties
    static let identifier = "MyPageCollectionViewFooter"

    // MARK: UI Components
    private let dividerView = DividerView(dividerType: .thin)

    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureSubviews()
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configuration
    private func configureSubviews() {
        addSubview(dividerView)
    }

    // MARK: Layout
    private func makeConstraints() {
        dividerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
}
