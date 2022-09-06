//
//  File.swift
//  BookFinder
//
//  Created by Isaac Sanchez on 05/09/22.
//

import Foundation

struct Book: Identifiable {
    let id: UUID?
    let name: String
    let url: String
}
