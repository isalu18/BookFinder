//
//  Constants.swift
//  BookFinder
//
//  Created by Isaac Sanchez on 02/10/22.
//

import Foundation

struct Constants {
    static let url = "https://openlibrary.org/subjects/"
}

enum EndPoints: String{
    case horror = "horror.json"
    case fantasy = "fantasy.json"
    case history = "history.json"
    case romance = "romance.json"
    case programming = "programming.json"
    
    var url: String {
        return Constants.url + self.rawValue
    }
}
