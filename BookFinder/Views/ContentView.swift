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
    
    @State var currentIndex: Int = 0
    @State var books: [Book] = [
        
    ]
    var body: some View {
        ZStack {
            Color("lightBrown")
                .ignoresSafeArea()
            VStack(spacing: 15) {
                Text("BookFinder 📚")
                    .font(.title.bold())
                    .frame( maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack(alignment: .leading, spacing: 12) {
                    Button {
                        
                    } label: {
                        Label {
                            Text("Back")
                                .fontWeight(.semibold)
                        } icon: {
                            Image(systemName: "chevron.left")
                                .font(.title3.bold())
                        }
                        .foregroundColor(.primary)
                    }
                    
                    Text("Categories")
                        .font(.title2.bold())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                SnapCarousel(index: $currentIndex, items: books) { book in
                    GeometryReader{ proxy in
                        VStack {
                            Image(systemName: "person.fill")
                                .data(url: URL(string: book.url)!)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: proxy.size.width)
                                .cornerRadius(20)
                            Text(book.name)
                        }
                    }
                }
                .padding(.vertical, 80)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .onAppear {
                for index in 1...5 {
                    books.append(Book(id: UUID(), name: "Harry Potter", url: "https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"))
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
