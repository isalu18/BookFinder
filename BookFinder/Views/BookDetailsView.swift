//
//  BookDetailsView.swift
//  BookFinder
//
//  Created by Isaac Sanchez on 14/11/22.
//

import SwiftUI

struct BookDetailsView: View {
    let id: String
    
    var body: some View {
        BookWebView(id: id)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .ignoresSafeArea()
    }
}

struct BookDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailsView(id: "/works/OL85892W")
    }
}
