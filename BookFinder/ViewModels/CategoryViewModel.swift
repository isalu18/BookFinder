//
//  CategoryViewModel.swift
//  BookFinder
//
//  Created by Isaac Sanchez on 14/09/22.
//

import Foundation
import Combine

//protocol CategoryViewModelProtocol {
//    func fetchBooksByCategory(name: String)
//    func getImageURL(_ key: String) -> String
//}
//
//class CategoryViewModel: CategoryViewModelProtocol, ObservableObject {
//
//    @Published var category = BookCategory()
//    @Published var books = [Items]()
//    private var bag = Set<AnyCancellable>()
//
//    func fetchBooksByCategory(name: String) {
//        let urlString = "https://openlibrary.org/subjects/\(name).json"
//        if let url = URL(string: urlString) {
//            URLSession
//                .shared
//                .dataTaskPublisher(for: url)
//                .receive(on: DispatchQueue.main)
//                .map(\.data)
//                .decode(type: BookCategory.self, decoder: JSONDecoder())
//                .sink { result in
//                    print(result)
//                } receiveValue: { [weak self] category in
//                    guard let self = self else { return }
//                    self.category = category
//                    self.books = category.works
//                    print("Nombre: \(category.name)")
//                    print("Libros: \(self.books)")
//                }
//                .store(in: &bag)
//
//        }
//    }
//
//    func getImageURL(_ key: String) -> String {
//        return "https://covers.openlibrary.org/b/olid/\(key)-L.jpg"
//    }
//
//}

protocol NetworkProtocol {
    var bag: Set<AnyCancellable> { get set }
    var category: BookCategory { get set }
    var books: [Items] { get set }
    
    func fetchBooksByCategory(name: String)
    func getImageURL(_ key: String) -> String
}

class NetworkManager: NetworkProtocol {
    internal var bag = Set<AnyCancellable>()
    @Published var category = BookCategory()
    @Published var books = [Items]()
    
    func fetchBooksByCategory(name: String) {
        let urlString = "https://openlibrary.org/subjects/\(name).json"
        if let url = URL(string: urlString) {
            URLSession
                .shared
                .dataTaskPublisher(for: url)
                .receive(on: DispatchQueue.main)
                .map(\.data)
                .decode(type: BookCategory.self, decoder: JSONDecoder())
                .sink { result in
                    print(result)
                } receiveValue: { [weak self] category in
                    guard let self = self else { return }
                    self.category = category
                    self.books = category.works
                    print("Nombre: \(category.name)")
                    print("Libros: \(self.books)")
                }
                .store(in: &bag)
            
        }
    }
    
    func getImageURL(_ key: String) -> String {
        return "https://covers.openlibrary.org/b/olid/\(key)-L.jpg"
    }
}

class CategoryViewModel: ObservableObject {
    var networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getHorrorBooks() {
        networkManager.fetchBooksByCategory(name: "horror")
    }
    
    func getRomanticBooks() {
        networkManager.fetchBooksByCategory(name: "romantic")
    }
    
    func getFantasyBooks() {
        networkManager.fetchBooksByCategory(name: "fantasy")
    }
    
    func getProgrammingBooks() {
        networkManager.fetchBooksByCategory(name: "programming")
    }
    
    func getLiteratureBooks() {
        networkManager.fetchBooksByCategory(name: "literature")
    }
}
