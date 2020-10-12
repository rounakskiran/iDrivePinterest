//
//  ProfileImage.swift
//  iDrivePinterest
//
//  Created by Rounak S Kiran on 10/10/20.
//

import Foundation

struct ProfileImage : Codable {
    
    let large : String?
    let medium : String?
    let small : String?
    
    enum CodingKeys: String, CodingKey {
        case large = "large"
        case medium = "medium"
        case small = "small"
    }
}
