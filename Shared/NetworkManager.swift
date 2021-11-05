//
//  NetworkManager.swift
//  Simple Network
//
//  Created by Eralp Mobile on 16.10.2021.
//

import Foundation

class NetworkManager {
    static func downloadData(_ url: String, completion: @escaping (_ data: Data?) -> Void) -> Void {
        guard let url = URL(string: url) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error ?? "Error")
                completion(nil)
                return
            }
            
            completion(data)
        }
        .resume()
    }
}
