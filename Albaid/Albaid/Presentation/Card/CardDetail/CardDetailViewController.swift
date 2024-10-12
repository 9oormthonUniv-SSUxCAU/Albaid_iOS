//
//  CardDetailViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

class CardDetailViewController: BaseViewController {

    // MARK: UI Components
    private(set) var backButton = BaseButton().then {
        $0.setImage(AlbaidButton.back.withTintColor(.albaidGray20), for: .normal)
    }

    private(set) var optionButton = BaseButton().then {
        $0.setImage(AlbaidButton.menu.withTintColor(.albaidGray20), for: .normal)
    }

    private let cardDetailView = CardDetailView()
    
    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Init
    init(id: Int) {
        super.init(nibName: nil, bundle: nil)
        setView(data: Contract.dummyContract[id])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        router.viewController = self
    }

    // MARK: Configuration
    override func configureSubviews() {        
        view.addSubview(cardDetailView)
    }

    // MARK: Layout
    override func makeConstraints() {
        cardDetailView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        backButton.tap = { [weak self] in
            guard let self else { return }
            router.popViewController()
        }

        optionButton.tap = { [weak self] in
            guard let self else { return }
            router.presentCardDetailOptionModalViewController()
        }

        cardDetailView.tapAddResume = { [weak self] in
            guard let self else { return }
            router.presentResumeViewController()
        }

        cardDetailView.cardContentView.tapContract = { [self] id in
//            router.presentContractDetailViewController(id: id)
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: nil,
                                 leftBarButton: backButton,
                                 rightBarButton: optionButton)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    // MARK: Data binding
    private func setView(data: Contract) {
        cardDetailView.cardContentView.setData(data: data)
        cardDetailView.cardContentView.cardContentDetailView.setData(data: data)
    }
}
