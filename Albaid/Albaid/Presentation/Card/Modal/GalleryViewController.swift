//
//  GalleryViewController.swift
//  Albaid
//
//  Created by 박지윤 on 10/7/24.
//

import UIKit
import PhotosUI

final class GalleryViewController: BaseViewController {

    // MARK: UI Components
    private(set) var closeButton = BaseButton().then {
        $0.setImage(AlbaidButton.close.withTintColor(.albaidGray30), for: .normal)
    }

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
 
        router.viewController = self
        checkGalleryAuth()
    }

    // MARK: Configuration
    override func configureSubviews() {
        view.addSubview(closeButton)
    }

    // MARK: Layout
    override func makeConstraints() {
        closeButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(25)
        }
    }

    // MARK: View Transition
    override func viewTransition() {
        closeButton.tap = { [weak self] in
            guard let self else { return }
            router.dismissViewController()
        }
    }

    private func checkGalleryAuth() {
        switch PHPhotoLibrary.authorizationStatus() {
        case .denied:
            print("거부")
            DispatchQueue.main.async {
                self.showAlertAuth("앨범")
            }
        case .authorized, .limited:
            print("허용")
            DispatchQueue.main.async {
                self.presentGallery()
            }
        case .notDetermined, .restricted:
            print("아직 결정하지 않은 상태")
            PHPhotoLibrary.requestAuthorization { state in
                if state == .authorized || state == .limited {
                    DispatchQueue.main.async {
                        self.presentGallery()
                    }
                }
            }
        default:
            break
        }
    }

    func showAlertAuth(_ type: String) {
        DispatchQueue.global().async {
            DispatchQueue.main.async {
                if let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
                    let alertVC = UIAlertController(
                        title: "설정",
                        message: "\(appName)이(가) \(type) 접근 허용되어 있지 않습니다. 설정화면으로 가시겠습니까?",
                        preferredStyle: .alert
                    )

                    let cancelAction = UIAlertAction(
                        title: "취소",
                        style: .cancel,
                        handler: nil
                    )

                    let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
                        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
                    }

                    alertVC.addAction(cancelAction)
                    alertVC.addAction(confirmAction)

                    self.present(alertVC, animated: true, completion: nil)
                }
            }
        }
    }

    private func presentGallery() {
        var config = PHPickerConfiguration()
        config.selectionLimit = 1
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        picker.modalPresentationStyle = .fullScreen

        present(picker, animated: true, completion: nil)
    }
}

extension GalleryViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        if results.isEmpty {
            dismiss(animated: true, completion: nil)
            dismiss(animated: true, completion: nil)
        } else {
            if let firstResult = results.first {
                firstResult.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] (image, error) in
                    if let selectedImage = image as? UIImage {
                        DispatchQueue.main.async {
                            print("Image selected: \(selectedImage)")
                        }
                    }
                }
            }
            DispatchQueue.main.async {
                self.dismiss(animated: true) {
                    self.router.presentScanLoadingViewController2()
                }
            }
        }
    }
}
