//
//  ViewController.swift
//  NewFeed
//
//  Created by Никита Троян on 10.12.2021.
//

import UIKit
import WebKit

class LoginViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView! {
        didSet {
            self.webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
    }
    
    private func loadWebView() {
        var urlComponents1 = URLComponents()
        urlComponents1.scheme = "https"
        urlComponents1.host = "oauth.vk.com"
        urlComponents1.path = "/authorize"
        urlComponents1.queryItems = [
            URLQueryItem(name: "client_id", value: "7981067"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "friends,photos,audio,video,wall,groups"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.81"),
            URLQueryItem(name: "revoke", value: "1")
        ]
        
        let request = URLRequest(url: urlComponents1.url!)
        
        self.webView.load(request)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment
        else { return decisionHandler(.allow) }
        
        let params = fragment
            .components(separatedBy: "&")
            .map{$0.components(separatedBy: "=")}
            .reduce([String:String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        guard let token = params["access_token"], let userId = params["user_id"]
        else {return}
        
        debugPrint(token, userId)
        
        Session.shared.userId = userId
        Session.shared.token = token
        
        let newsVC = UIStoryboard(.news).instantiate(NewsViewController.self)
        newsVC.modalPresentationStyle = .fullScreen
        self.present(newsVC, animated: true, completion: nil)
        
        decisionHandler(.cancel)
    }
}

