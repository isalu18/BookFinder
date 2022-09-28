//
//  Category.swift
//  BookFinder
//
//  Created by Isaac Sanchez on 14/09/22.
//

import Foundation

struct BookCategory: Codable {
    var name: String = ""
    var works: [Items] = []
}

struct Items: Codable, Identifiable {
    var id: String {
        return key
    }
    let key: String
    let title: String
    let cover_edition_key: String
}
