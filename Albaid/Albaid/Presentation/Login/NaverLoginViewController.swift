//
//  NaverLoginViewController.swift
//  Albaid
//
//  Created by 박지윤 on 10/8/24.
//

import WebKit

class NaverLoginViewController: BaseViewController, WKNavigationDelegate {

    var webView: WKWebView!
    var naverURL: URL

    // MARK: Environment
    private let router = BaseRouter()

    // MARK: Init
    init(url: URL) {
        self.naverURL = url
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        router.viewController = self

        webView = WKWebView(frame: self.view.frame)
        webView.navigationDelegate = self
        self.view.addSubview(webView)
        
        if let url = URL(string: "\(naverURL)") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }

    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        guard let urlString = webView.url?.absoluteString else {
            return
        }

        guard let url = webView.url else {
            return
        }

        if urlString.hasPrefix("\(URLConst.base)\(URLConst.success)") {
            print("Matched URL: \(url)")
            if let queryParams = extractQueryParams(from: url) {
                if let type = queryParams["type"],
                   let accessToken = queryParams["accessToken"],
                   let refreshToken = queryParams["refreshToken"],
                   let accessTokenExpiresIn = queryParams["accessExpireDuration"],
                   let refreshTokenExpiresIn = queryParams["refreshExpireDuration"] {
                    print("type: \(type)")
                    print("accessToken: \(accessToken)")
                    print("refreshToken: \(refreshToken)")
                    print("accessTokenExpiresIn: \(accessTokenExpiresIn)")
                    print("refreshTokenExpiresIn: \(refreshTokenExpiresIn)")

                    UserDefaultHandler.accessToken = accessToken
                    UserDefaultHandler.refreshToken = refreshToken
                    UserDefaultHandler.accessTokenExpiresIn = Int(accessTokenExpiresIn) ?? 0
                    UserDefaultHandler.refreshTokenExpiresIn = Int(refreshTokenExpiresIn) ?? 0
                    UserDefaultHandler.loginStatus = true

                    router.presentTabBarViewController()
                }
            }
        }
    }

    func extractQueryParams(from url: URL) -> [String: String]? {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let queryItems = components.queryItems else { return nil }

        var params: [String: String] = [:]

        for queryItem in queryItems {
            if let value = queryItem.value {
                params[queryItem.name] = value
            }
        }

        return params
    }
}
