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
        NavigationView {
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
                            SnapCarousel(category: Category.horror.nameCapital, index: $currentIndex, items: viewModel.horrorCategory.works) { book in
                                GeometryReader{ proxy in
                                    VStack {
                                        BookImageView(url: viewModel.fetchBookImage(book.cover_edition_key))
                                            .frame(width: proxy.size.width)
                                        NavigationLink(destination: BookDetailsView(id: book.id)) {
                                            Text(book.title)
                                                .foregroundColor(.black)
                                                .bold()
                                                .underline()
                                        }
                                        
                                    }
                                }
                            }
                            SnapCarousel(category: Category.fantasy.nameCapital, index: $currentIndex, items: viewModel.fantasyCategory.works) { book in
                                GeometryReader { proxy in
                                    VStack {
//                                        BookImageView(url: viewModel.fetchBookImage(book.cover_edition_key))
                                        BookImageView(url: viewModel.fetchBookImage(book.cover_edition_key))
                                            .frame(width: proxy.size.width)
                                        NavigationLink(destination: BookDetailsView(id: book.id)) {
                                            Text(book.title)
                                                .foregroundColor(.black)
                                                .bold()
                                                .underline()
                                        }
                                    }
                                }
                            }
                            SnapCarousel(category: Category.history.nameCapital, index: $currentIndex, items: viewModel.historyCategory.works) { book in
                                GeometryReader{ proxy in
                                    VStack {
                                        BookImageView(url: viewModel.fetchBookImage(book.cover_edition_key))
                                            .frame(width: proxy.size.width)
                                        NavigationLink(destination: BookDetailsView(id: book.id)) {
                                            Text(book.title)
                                                .foregroundColor(.black)
                                                .bold()
                                                .underline()
                                        }
                                    }
                                }
                            }
                            SnapCarousel(category: Category.romance.nameCapital, index: $currentIndex, items: viewModel.romanceCategory.works) { book in
                                GeometryReader{ proxy in
                                    VStack {
                                        BookImageView(url: viewModel.fetchBookImage(book.cover_edition_key))
                                            .frame(width: proxy.size.width)
                                        NavigationLink(destination: BookDetailsView(id: book.id)) {
                                            Text(book.title)
                                                .foregroundColor(.black)
                                                .bold()
                                                .underline()
                                        }
                                    }
                                }
                            }
                            SnapCarousel(category: Category.programming.nameCapital, index: $currentIndex, items: viewModel.programmingCategory.works) { book in
                                GeometryReader{ proxy in
                                    VStack {
                                        BookImageView(url: viewModel.fetchBookImage(book.cover_edition_key))
                                            .frame(width: proxy.size.width)
                                        NavigationLink(destination: BookDetailsView(id: book.id)) {
                                            Text(book.title)
                                                .foregroundColor(.black)
                                                .bold()
                                                .underline()
                                        }
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
