//
//  Post.swift
//  Simple Network
//
//  Created by Eralp Mobile on 15.10.2021.
//

import Foundation

// MARK: - Post
struct Post: Identifiable, Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
