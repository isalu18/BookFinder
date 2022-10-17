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
//    var horrorCategory: HorrorCategory { get set }
//    var fantasyCategory: FantasyCategory { get set }
//    var historyCategory: HistoryCategory { get set }
//    var romanceCategory: RomanceCategory { get set }
//    var programmingCategory: ProgrammingCategory { get set }
    
    func fetchBooksWithDispatchGroup()
}

class CategoryViewModel: CategoryViewModelProtocol, ObservableObject {
    var horrorCategory = BookCategory()
    var fantasyCategory = BookCategory()
    var historyCategory = BookCategory()
    var romanceCategory = BookCategory()
    var programmingCategory = BookCategory()
    
    @Published var isLoading: Bool = false
    
    init() {
        fetchBooksWithDispatchGroup()
    }
    
    func fetchBooksWithDispatchGroup() {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        
        Extensions.getData(EndPoints.horror.url, BookCategory.self) { data in
            self.horrorCategory = data
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
                
        Extensions.getData(EndPoints.fantasy.url, BookCategory.self) { data in
            self.fantasyCategory = data
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        
        Extensions.getData(EndPoints.history.url, BookCategory.self) { data in
            self.historyCategory = data
            print("history: \(self.historyCategory)")
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        
        Extensions.getData(EndPoints.romance.url, BookCategory.self) { data in
            self.romanceCategory = data
            print("mental: \(self.romanceCategory)")
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        
        Extensions.getData(EndPoints.programming.url, BookCategory.self) { data in
            self.programmingCategory = data
            print("programming: \(self.programmingCategory)")
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.isLoading = true
        }
    }
    
    var horrorTitle: String {
        horrorCategory.name.capitalized
    }
    
    var fantasyTitle: String {
        fantasyCategory.name.capitalized
    }
    
    var historyTitle: String {
        historyCategory.name.capitalized
    }
    
    var romanceTitle: String {
        romanceCategory.name.capitalized
    }
    
    var programmingTitle: String {
        programmingCategory.name.capitalized
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
