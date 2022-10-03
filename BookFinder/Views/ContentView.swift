//
//  ContentView.swift
//  BookFinder
//
//  Created by Isaac Sanchez on 04/09/22.
//

import SwiftUI

struct ContentView: View {
    let booksSample: [Book] = [
        Book(id: UUID(), name: "Harry Potter", url: "https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
        Book(id: UUID(), name: "El principito", url: "https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
        Book(id: UUID(), name: "Percy Jackson", url: "https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
        Book(id: UUID(), name: "El Hobbit", url: "https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
    ]
    
    @StateObject var viewModel = CategoryViewModel()
    @State var currentIndex: Int = 0
    @State var books: [Book] = [
        
    ]

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
                        
                        SnapCarousel(category: viewModel.horrorCategory.name, index: $currentIndex, items: viewModel.horrorCategory.works) { book in
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
                        SnapCarousel(category: viewModel.fantasyCategory.name, index: $currentIndex, items: viewModel.fantasyCategory.works) { book in
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
                    .onAppear {
                        
                        //                for index in 1...5 {
                        //                    books.append(Book(id: UUID(), name: "Harry Potter", url: "https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"))
                        //                }
//                        categoryVM.fetchBooksByCategory(name: "horror")
//                        categoryVM.getHorrorBooks()
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
