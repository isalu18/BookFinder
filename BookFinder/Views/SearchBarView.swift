//
//  SearchBarView.swift
//  BookFinder
//
//  Created by Isaac Sanchez on 13/09/22.
//

import SwiftUI

struct SearchBarView: View {
    @State private var input = ""
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    
    var body: some View {
            NavigationView {
                List {
                    ForEach(searchResults, id: \.self) { name in
                        NavigationLink(destination: Text(name)) {
                            Text(name)
                        }
                    }
                }
                .searchable(text: $input)
                .navigationTitle("Contacts")
            }
        }

        var searchResults: [String] {
            if input.isEmpty {
                return names
            } else {
                return names.filter { $0.contains(input) }
            }
        }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
