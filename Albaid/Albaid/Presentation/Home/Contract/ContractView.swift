//
//  ContractView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ContractView: BaseView {
    
    // MARK: UI Components
    private(set) var contractSearchBar = UISearchBar().then {
        $0.placeholder = "근로계약서 검색"
        $0.searchBarStyle = .minimal
        $0.barTintColor = .gray95
    }

    private(set) var contractCollectionView = ContractCollectionView()

    // MARK: Properties

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(contractSearchBar)
        addSubview(contractCollectionView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        contractSearchBar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(116)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        contractCollectionView.snp.makeConstraints {
            $0.top.equalTo(contractSearchBar.snp.bottom).offset(25)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
