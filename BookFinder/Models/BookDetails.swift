//
//  File.swift
//  BookFinder
//
//  Created by Isaac Sanchez on 05/09/22.
//

import Foundation

struct BookDetails: Identifiable {
    let id: UUID?
    let title: String
    let description: String
    let subjects: [String]
}
