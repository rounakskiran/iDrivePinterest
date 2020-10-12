//
//  PasteBinModel.swift
//  iDrivePinterest
//
//  Created by Rounak S Kiran on 10/10/20.
//

import Foundation

struct PasteBinModel : Codable {
    
    let categories : [CategoryModel]?
    let color : String?
    let createdAt : String?
    let currentUserCollections : [String]?
    let height : Int?
    let id : String?
    let likedByUser : Bool?
    let likes : Int?
    let links : LinkModel?
    let urls : UrlModel?
    let user : UserModel?
    let width : Int?
    
    enum CodingKeys: String, CodingKey {
        case categories = "categories"
        case color = "color"
        case createdAt = "created_at"
        case currentUserCollections = "current_user_collections"
        case height = "height"
        case id = "id"
        case likedByUser = "liked_by_user"
        case likes = "likes"
        case links = "links"
        case urls = "urls"
        case user = "user"
        case width = "width"
    }
}
