//
//  UIViewController+Extension.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit.UIViewController

extension UIViewController {
    func setDefaultNavigationItem(title: String?, leftBarButton: BaseButton?, rightBarButton: BaseButton?) {
        if let title = title {
            navigationItem.title = title
        }
        if let leftBarButton = leftBarButton {
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarButton)
        }
        if let rightBarButton = rightBarButton {
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarButton)
        }
    }
}
