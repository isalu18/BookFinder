//
//  CategoryViewModel.swift
//  BookFinder
//
//  Created by Isaac Sanchez on 14/09/22.
//

import Foundation
import Combine

//MARK: - Multiple API Call (Dispatch Group)

protocol CategoryViewModelProtocol {
    var bag: Set<AnyCancellable> { get set }
    var category: BookCategory { get set }
    var books: [Items] { get set }
    
    func fetchBooksWithDispatchGroup()
}

class CategoryViewModel: CategoryViewModelProtocol, ObservableObject {
    internal var bag = Set<AnyCancellable>()
    var horrorCategory = HorrorCategory()
    var fantasyCategory = FantasyCategory()
    
    @Published var category = BookCategory()
    @Published var books = [Items]()
    @Published var isLoading: Bool = false
    
    init() {
        fetchBooksWithDispatchGroup()
    }
    
    func fetchBooksWithDispatchGroup() {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        
        Extensions.getData(EndPoints.horror.url, HorrorCategory.self) { data in
            self.horrorCategory = data
            print("horror: \(self.horrorCategory)")
            
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
                
        Extensions.getData(EndPoints.fantasy.url, FantasyCategory.self) { data in
            self.fantasyCategory = data
            print("fantasy: \(self.fantasyCategory)")
            
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.isLoading = true
        }
    }
    
    func getImageURL(_ key: String) -> String {
        return "https://covers.openlibrary.org/b/olid/\(key)-L.jpg"
    }
}

//MARK: - Single API Call (Not used)

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
