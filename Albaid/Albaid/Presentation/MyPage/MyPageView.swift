//
//  MyPageView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class MyPageView: BaseView {
    
    let my = ["계정 설정", "알림 설정", "내 급여 총계", "근로계약서 관리", "이력서 관리", "멤버십"]
    let service = ["공지사항", "이벤트", "자주 하는 질문", "고객센터", "이용약관", "로그아웃"]
    var dict1 = ["height": 165, "age" : 100]

    let headerTitle = ["MY", "서비스 안내 • 문의"]
    let headerImage = [AlbaidImage.user, AlbaidImage.service]

    // MARK: UI Components
    public lazy var myPageCollectionView: UICollectionView = {
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
    var tapAlbum: (() -> Void)?
    var tapCell: ((Int, Int) -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        setCollectionView()

        addSubview(myPageCollectionView)
    }

    // MARK: Layout
    override func makeConstraints() {
        myPageCollectionView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.bottom.horizontalEdges.equalToSuperview()
        }
    }
}

extension MyPageView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setCollectionView() {
        myPageCollectionView.dataSource = self
        myPageCollectionView.delegate = self
        myPageCollectionView.register(MyPageCollectionViewCell.self,
                                      forCellWithReuseIdentifier: MyPageCollectionViewCell.identifier)
        myPageCollectionView.register(MyPageCollectionViewHeader.self,
                                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                    withReuseIdentifier: MyPageCollectionViewHeader.identifier)
        myPageCollectionView.register(MyPageCollectionViewFooter.self,
                                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                    withReuseIdentifier: MyPageCollectionViewFooter.identifier)
        myPageCollectionView.isPagingEnabled = false
        myPageCollectionView.showsVerticalScrollIndicator = false
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return my.count
        } else {
            return service.count
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MyPageCollectionViewCell.identifier,
            for: indexPath) as? MyPageCollectionViewCell else { return UICollectionViewCell() }

        if indexPath.section == 0 {
            cell.titleLabel.text = my[indexPath.row]
        } else {
            cell.titleLabel.text = service[indexPath.row]
        }
//        cell.setData(data: User.dummyUser.card?[indexPath.row])

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tapCell?(indexPath.section, indexPath.row)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)

        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 27)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width

        if section == 0 {
            return CGSize(width: screenWidth - 40, height: 220)
        } else {
            return CGSize(width: screenWidth - 40, height: 24)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width

        if section == 0 {
            return CGSize(width: screenWidth - 40, height: 60)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath) -> UICollectionReusableView {
            if kind == UICollectionView.elementKindSectionHeader {
                guard let header = myPageCollectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: MyPageCollectionViewHeader.identifier,
                    for: indexPath) as? MyPageCollectionViewHeader else { return UICollectionReusableView()
                }

                if indexPath.section != 0 {
                    header.profileView.removeFromSuperview()
                }

                header.titleImageView.image = headerImage[indexPath.section]
                header.titleLabel.text = headerTitle[indexPath.section]
                header.tapAlbum = self.tapAlbum

                return header
            } else {
                guard let footer = myPageCollectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: MyPageCollectionViewFooter.identifier,
                    for: indexPath) as? MyPageCollectionViewFooter else { return UICollectionReusableView() }

                return footer
            }
        }
}
