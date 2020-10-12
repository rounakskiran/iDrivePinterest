//
//  Url.swift
//  iDrivePinterest
//
//  Created by Rounak S Kiran on 10/10/20.
//

import Foundation

struct UrlModel : Codable {
    
    let full : String?
    let raw : String?
    let regular : String?
    let small : String?
    let thumb : String?
    
    enum CodingKeys: String, CodingKey {
        case full = "full"
        case raw = "raw"
        case regular = "regular"
        case small = "small"
        case thumb = "thumb"
    }
}
