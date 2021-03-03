//
//  KakaoZipCodeVC.swift
//  apiTest
//
//  Created by YOUNG on 2021/02/26.
//

import UIKit
import WebKit

class KakaoZipCodeVC: UIViewController {
var webView: WKWebView!
        let indicator = UIActivityIndicatorView(style: .medium)
        var address = ""

        // MARK: - Lifecycle
        override func viewDidLoad() {
            super.viewDidLoad()
            configureUI()
        }

        // MARK: - UI
        private func configureUI() {
            view.backgroundColor = .white
            setAttributes()
            setContraints()
        }

        private func setAttributes() {
            let contentController = WKUserContentController()
            contentController.add(self, name: "callBackHandler")

            let configuration = WKWebViewConfiguration()
            configuration.userContentController = contentController

            webView = WKWebView(frame: .zero, configuration: configuration)
            self.webView?.navigationDelegate = self

            guard let url = URL(string: "https://kasroid.github.io/Kakao-Postcode/"),
                let webView = webView
                else { return }
            let request = URLRequest(url: url)
            webView.load(request)
            indicator.startAnimating()
        }

        private func setContraints() {
            guard let webView = webView else { return }
            view.addSubview(webView)
            webView.translatesAutoresizingMaskIntoConstraints = false

            webView.addSubview(indicator)
            indicator.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                webView.topAnchor.constraint(equalTo: view.topAnchor),
                webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

                indicator.centerXAnchor.constraint(equalTo: webView.centerXAnchor),
                indicator.centerYAnchor.constraint(equalTo: webView.centerYAnchor),
            ])
        }
    }

    extension KakaoZipCodeVC: WKScriptMessageHandler {
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            if let data = message.body as? [String: Any] {
                address = data["roadAddress"] as? String ?? ""
            }
            let joinVC = JoinViewController()
            joinVC.txtJoinAddr?.text = self.address
            print(address)
            guard let pvc = self.presentingViewController else { return }
            pvc.present(JoinViewController(), animated: true, completion: nil)

            self.dismiss(animated: true) {
                joinVC.txtJoinAddr?.text = self.address
            print(self.address)
                
                Share.Addr = self.address
                
            }
//            guard let previousVC = presentingViewController as? JoinViewController else { return }
//            print(address)
//            previousVC.txtJoinAddr.text = address
//            self.dismiss(animated: true, completion: nil)
        }
    }

    extension KakaoZipCodeVC: WKNavigationDelegate {
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            indicator.startAnimating()
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            indicator.stopAnimating()
        }
}
