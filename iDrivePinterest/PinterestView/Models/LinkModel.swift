//
//  Link.swift
//  iDrivePinterest
//
//  Created by Rounak S Kiran on 10/10/20.
//

import Foundation

struct LinkModel : Codable {
    
    let html : String?
    let likes : String?
    let photos : String?
    let selfLink : String?
    let download : String?
    
    enum CodingKeys: String, CodingKey {
        case html = "html"
        case likes = "likes"
        case photos = "photos"
        case selfLink = "self"
        case download = "download"
    }    
}
