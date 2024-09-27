//
//  ImageLiteral.swift
//  Albaid
//
//  Created by 박지윤 on 9/27/24.
//

import UIKit

public enum AlbaidImage {
    public static var splash: UIImage { .load(name: "splash")}
    public static var logo: UIImage { .load(name: "logo")}
    public static var loginLogo: UIImage { .load(name: "login_logo")}

    /// onboarding
    public static var onboarding1: UIImage { .load(name: "onboarding1")}
    public static var onboarding2: UIImage { .load(name: "onboarding2")}
    public static var onboarding3: UIImage { .load(name: "onboarding3")}

    /// character
    public static var character0: UIImage { .load(name: "character0")}
    public static var character1: UIImage { .load(name: "character1")}

    public static var ad: UIImage { .load(name: "ad")}

    public static var coffeeGreen: UIImage { .load(name: "coffee_green")}
    public static var coffeeBlue: UIImage { .load(name: "coffee_blue")}
    public static var coffeePink: UIImage { .load(name: "coffee_pink")}
}

public enum AlbaidButton {
    /// tabBar
    public static var home: UIImage { .load(name: "ic_tabbar_home") }
    public static var homeFilled: UIImage { .load(name: "ic_tabbar_home_filled") }
    public static var calendar: UIImage { .load(name: "ic_tabbar_calendar") }
    public static var calendarFilled: UIImage { .load(name: "ic_tabbar_calendar_filled") }
    public static var card: UIImage { .load(name: "ic_tabbar_card") }
    public static var cardFilled: UIImage { .load(name: "ic_tabbar_card_filled") }
    public static var myPage: UIImage { .load(name: "ic_tabbar_mypage") }
    public static var myPageFilled: UIImage { .load(name: "ic_tabbar_mypage_filled") }

    /// login
    public static var naver: UIImage { .load(name: "ic_login_naver") }
    public static var kakao: UIImage { .load(name: "ic_login_kakao") }
    public static var google: UIImage { .load(name: "ic_login_google") }
    public static var apple: UIImage { .load(name: "ic_login_apple") }

    /// navigation
    public static var add: UIImage { .load(name: "ic_navigation_add") }
    public static var back: UIImage { .load(name: "ic_navigation_back") }
    public static var close: UIImage { .load(name: "ic_navigation_close") }
    public static var bell: UIImage { .load(name: "ic_navigation_bell") }
    public static var menu: UIImage { .load(name: "ic_navigation_menu") }

    /// menu
    public static var share: UIImage { .load(name: "ic_menu_share") }
    public static var edit: UIImage { .load(name: "ic_menu_edit") }
    public static var delete: UIImage { .load(name: "ic_menu_delete") }

    /// home
    public static var camera: UIImage { .load(name: "ic_home_camera") }
    public static var contract: UIImage { .load(name: "ic_home_contract") }
    public static var resume: UIImage { .load(name: "ic_home_resemu") }

    /// etc
    public static var detail: UIImage { .load(name: "ic_detail") }

    public static var payment: UIImage { .load(name: "payment")}
    public static var pig: UIImage { .load(name: "pig")}
    public static var tax: UIImage { .load(name: "tax")}
}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
}
