//
//  BookImageView.swift
//  BookFinder
//
//  Created by Isaac Sanchez on 10/11/22.
//

import SwiftUI

struct BookImageView: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
                .progressViewStyle(.circular)
        }
    }
}

struct BookImageView_Previews: PreviewProvider {
    static var previews: some View {
        BookImageView(url: URL(string: "https://blckbirds.com/wp-content/uploads/2021/10/pexels-kammeran-gonzalezkeola-6128227-2.jpg"))
    }
}
