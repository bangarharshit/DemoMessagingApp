//
//  Person.swift
//  demo_app
//
//  Created by Harshit Bangar on 09/04/24.
//

import Foundation

struct PersonDetails : Hashable {
    let name: String
    let profilePicUrl: String
//    let identifier: String // uuid
//    let phoneNumber: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(profilePicUrl)
    }
    
    static func ==(lhs: PersonDetails, rhs: PersonDetails) -> Bool {
        return lhs.name == rhs.name &&
        lhs.profilePicUrl == rhs.profilePicUrl
    }
}
