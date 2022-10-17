//
//  ContentView.swift
//  BookFinder
//
//  Created by Isaac Sanchez on 04/09/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CategoryViewModel()
    @State var currentIndex: Int = 0

    let image = Image(systemName: "person.fill")
    
    var body: some View {
        ZStack {
            Color("lightBrown")
                .ignoresSafeArea()
            VStack {
                Text("BookFinder 📚")
                    .font(.title.bold())
                    .frame( maxWidth: .infinity, alignment: .leading)
                    .padding()
                ScrollView {
                    VStack(spacing: 15) {
                        Text("Categories")
                            .font(.title2.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                        SnapCarousel(category: viewModel.horrorTitle, index: $currentIndex, items: viewModel.horrorCategory.works) { book in
                            GeometryReader{ proxy in
                                VStack {
                                    image
                                        .data(url: URL(string: viewModel.getImageURL(book.cover_edition_key))!)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: proxy.size.width)
                                        .cornerRadius(20)
                                    Text(book.title)
                                }
                            }
                        }
                        SnapCarousel(category: viewModel.fantasyTitle, index: $currentIndex, items: viewModel.fantasyCategory.works) { book in
                            GeometryReader{ proxy in
                                VStack {
                                    image
                                        .data(url: URL(string: viewModel.getImageURL(book.cover_edition_key))!)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: proxy.size.width)
                                        .cornerRadius(20)
                                    Text(book.title)
                                }
                            }
                        }
                        SnapCarousel(category: viewModel.historyTitle, index: $currentIndex, items: viewModel.historyCategory.works) { book in
                            GeometryReader{ proxy in
                                VStack {
                                    image
                                        .data(url: URL(string: viewModel.getImageURL(book.cover_edition_key))!)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: proxy.size.width)
                                        .cornerRadius(20)
                                    Text(book.title)
                                }
                            }
                        }
                        SnapCarousel(category: viewModel.romanceTitle, index: $currentIndex, items: viewModel.romanceCategory.works) { book in
                            GeometryReader{ proxy in
                                VStack {
                                    image
                                        .data(url: URL(string: viewModel.getImageURL(book.cover_edition_key))!)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: proxy.size.width)
                                        .cornerRadius(20)
                                    Text(book.title)
                                }
                            }
                        }
                        SnapCarousel(category: viewModel.programmingTitle, index: $currentIndex, items: viewModel.programmingCategory.works) { book in
                            GeometryReader{ proxy in
                                VStack {
                                    image
                                        .data(url: URL(string: viewModel.getImageURL(book.cover_edition_key))!)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: proxy.size.width)
                                        .cornerRadius(20)
                                    Text(book.title)
                                }
                            }
                        }
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
