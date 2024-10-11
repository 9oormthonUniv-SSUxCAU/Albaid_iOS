//
//  ResumeViewController.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ResumeViewController: BaseViewController {

    // MARK: UI Components
    private(set) var backButton = BaseButton().then {
        $0.setImage(AlbaidButton.back.withTintColor(.albaidGray30), for: .normal)
    }

    private let addButton = BaseButton().then {
        $0.setImage(AlbaidButton.add, for: .normal)
    }

    private let resumeView = ResumeView()

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Properties
    var resumeList: [ResumeList] = []

    // MARK: Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        getResume()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setData(data: resumeList)
        router.viewController = self
    }
    
    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(resumeView)
    }
    
    // MARK: Layout
    override func makeConstraints() {
        resumeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        backButton.tap = { [weak self] in
            guard let self else { return }
            router.popViewController()
        }

        addButton.tap = { [weak self] in
            guard let self else { return }
            router.presentResumeAddViewController()
        }

        resumeView.tapCell = { [self] id in
            router.presentResumeDetailViewController(id: id)
        }

        resumeView.tapOption = { [weak self] in
            guard let self else { return }
            router.presentResumeOptionModalViewController()
        }
    }

    // MARK: Navigation Item
    override func setNavigationItem() {
        setDefaultNavigationItem(title: "이력서",
                                 leftBarButton: backButton,
                                 rightBarButton: addButton)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    // MARK: Data binding
    private func setData(data: [ResumeList]) {
        resumeView.setViewData(data: data)
    }
}

extension ResumeViewController {
    // MARK: Networking
    private func getResume() {
        print("🔔 getResume called")
        NetworkService.shared.resume.getResume() {
            [self] result in
            switch result {
            case .success(let response):
                guard let data = response as? ResumeListResponse else { return }
                print("🎯 getResume success: " + "\(data)")
                resumeList = data.result
            case .requestErr(let errorResponse):
                dump(errorResponse)
                guard let data = errorResponse as? ErrorResponse else { return }
                print(data)
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            case .pathErr:
                print("pathErr")
            }
        }
    }
}
