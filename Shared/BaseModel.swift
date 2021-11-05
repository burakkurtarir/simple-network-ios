//
//  BaseModel.swift
//  Simple Network
//
//  Created by Eralp Mobile on 16.10.2021.
//

import Foundation

// Eğer gerçek bir servis olsaydı, muhtemelen bu şekilde bir response gelirdi
struct BaseResponseModel<T: Codable> : Codable {
    var data: T?
    var error: BaseErrorModel?
    var statusCode: Int
    var message: String
}

struct BaseErrorModel : Codable {
    var errorCode: Int
    var message: String
}
