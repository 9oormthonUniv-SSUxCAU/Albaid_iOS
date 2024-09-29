//
//  ScanCameraView.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

final class ScanCameraView: BaseView {
    
    // MARK: UI Components
    private(set) var cameraButton = BaseButton().then {
        $0.setImage(AlbaidButton.shoot, for: .normal)
    }

    // MARK: Properties
    var tapCamera: (() -> Void)?

    // MARK: Configuration
    override func configureSubviews() {
        addSubview(cameraButton)

        addButtonEvent()
    }
    
    // MARK: Layout
    override func makeConstraints() {
        cameraButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(70)
            $0.bottom.equalToSuperview().inset(35)
        }
    }

    // MARK: Event
    private func addButtonEvent() {
        cameraButton.addTarget(self, action: #selector(handleCameraButton), for: .touchUpInside)
    }

    @objc
    private func handleCameraButton() {
        tapCamera?()
    }
}
