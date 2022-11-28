//
//  Constants.swift
//  BookFinder
//
//  Created by Isaac Sanchez on 02/10/22.
//

import Foundation

struct Constants {
    static let categoryURL = "https://openlibrary.org/subjects/"
    static let bookByIdURL = "https://openlibrary.org"
}

enum EndPoints: String{
    case horror = "horror.json"
    case fantasy = "fantasy.json"
    case history = "history.json"
    case romance = "romance.json"
    case programming = "programming.json"
    
    var url: String {
        return Constants.categoryURL + self.rawValue
    }
}

enum Category: String {
    case horror, fantasy, history, romance, programming
    
    var nameCapital: String {
        self.rawValue.capitalized
    }
}
