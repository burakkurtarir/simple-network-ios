//
//  ContentViewModel.swift
//  Simple Network
//
//  Created by Eralp Mobile on 15.10.2021.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        //fetchData()
        fetchDataWithCombine()
    }
    
    func fetchDataWithCombine() -> () {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap { output in
                return output.data
            }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .sink { completion in
                print("Completion result")
                print(completion)
            } receiveValue: { [weak self] posts in
                self?.posts = posts
            }
            .store(in: &cancellables)
            
    }
    
    func fetchData() -> () {
        NetworkManager.downloadData("https://jsonplaceholder.typicode.com/posts") { data in
            if let data = data {
                guard let newPost = try? JSONDecoder().decode([Post].self, from:  data) else {
                    print("JsonDecoder error")
                    return
                }
                DispatchQueue.main.async { [weak self] in
                    self?.posts = newPost
                }
            } else {
                print("Error")
                return
            }
        }
    }
    
}
