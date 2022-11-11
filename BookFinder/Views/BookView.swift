//
//  BookView.swift
//  BookFinder
//
//  Created by Isaac Sanchez on 05/09/22.
//

import SwiftUI

struct BookView: View {
    
    let books: [BookDetails] = [
        BookDetails(id: UUID(), name: "Harry Potter", url: "https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
        BookDetails(id: UUID(), name: "El principito", url: "https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
        BookDetails(id: UUID(), name: "Percy Jackson", url: "https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
        BookDetails(id: UUID(), name: "El Hobbit", url: "https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
    ]
    
    var body: some View {
        HStack(spacing: 2) {
            TabView {
                ForEach(books) { book in
                    VStack {
                        Image(systemName: "person.fill")
//                            .data(url: URL(string: book.url)!)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                        Text(book.name)
                            .font(.caption)
                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
        }
    }
    
    var despues: some View {
        VStack {
            Text("BookFinder 📚")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            TabView {
                ForEach(books) { book in
                    VStack {
                        Image(systemName: "person.fill")
//                            .data(url: URL(string: book.url)!)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                        Text(book.name)
                            .font(.caption)
                    }
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
    }
}
