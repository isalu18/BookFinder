//
//  Extensions.swift
//  BookFinder
//
//  Created by Isaac Sanchez on 05/09/22.
//

import SwiftUI

class Extensions {
    //Retrieve data from the API
    static func getData<DataKind:Codable>(_ url: String,_ dataKind: DataKind.Type, _ completion: @escaping (_ data:DataKind)->Void) {
        let url = URL(string: url)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error == nil && data != nil {
                let convertedData = try! JSONDecoder().decode(dataKind, from: data!)
                completion(convertedData)
            }
        }.resume()
    }
}
extension Image {
    func data(url:URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}
