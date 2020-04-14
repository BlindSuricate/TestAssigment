//
//  User.swift
//  TestAssigment
//
//  Created by user on 2020-04-14.
//  Copyright © 2020 TarasenkoSerhii. All rights reserved.
//

import Foundation

struct User {
    var image: String
    var firstName: String
    var lastName: String
    var gender: String
    var dateOfBirth: String
    var phoneNumber: String
    
    init?(userData: UserData) {
        image = userData.results.first!.picture.large
        firstName = userData.results.first!.name.first
        lastName = userData.results.first!.name.last
        gender = userData.results.first!.gender
        dateOfBirth = userData.results.first!.dob.date
        phoneNumber = userData.results.first!.phone
    }
}
