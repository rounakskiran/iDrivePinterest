//
//  CategoryModel.swift
//  iDrivePinterest
//
//  Created by Rounak S Kiran on 10/10/20.
//

import Foundation

struct CategoryModel : Codable {
    
    let id : Int?
    let links : LinkModel?
    let photoCount : Int?
    let title : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case links = "links"
        case photoCount = "photo_count"
        case title = "title"
    }
}
