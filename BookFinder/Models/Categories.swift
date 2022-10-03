//
//  Categories.swift
//  BookFinder
//
//  Created by Isaac Sanchez on 28/09/22.
//

import Foundation

struct HorrorCategory: Codable {
    var name: String = ""
    var works: [Items] = []
}

struct FantasyCategory: Codable {
    var name: String = ""
    var works: [Items] = []
}
