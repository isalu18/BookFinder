//
//  BookView.swift
//  BookFinder
//
//  Created by Isaac Sanchez on 05/09/22.
//

import SwiftUI
import WebKit

struct BookWebView: UIViewRepresentable {
    let id: String
    let url: URL?
    
    init(id: String) {
        self.id = id
        url = URL(string: Constants.bookByIdURL + id)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let safeURL = url else {
            return
        }
        let request = URLRequest(url: safeURL)
        webView.load(request)
    }
}
