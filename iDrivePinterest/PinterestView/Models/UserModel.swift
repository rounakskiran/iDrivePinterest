//
//  User.swift
//  iDrivePinterest
//
//  Created by Rounak S Kiran on 10/10/20.
//

import Foundation

struct UserModel : Codable {
    
    let id : String?
    let links : LinkModel?
    let name : String?
    let profileImage : ProfileImage?
    let username : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case links = "links"
        case name = "name"
        case profileImage = "profile_image"
        case username = "username"
    }
}
