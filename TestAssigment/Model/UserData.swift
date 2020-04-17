//
//  UserData.swift
//  TestAssigment
//
//  Created by user on 2020-04-14.
//  Copyright © 2020 TarasenkoSerhii. All rights reserved.
//

import Foundation

// MARK: - UserData
struct UserData: Codable {
    let results: [Result]
}



// MARK: - Result
struct Result: Codable {
    let gender: String
    let name: Name
    let dob, registered: Dob
    let phone, cell: String
    let picture: Picture
}

// MARK: - Dob
struct Dob: Codable {
    let date: String
}



// MARK: - Name
struct Name: Codable {
    let title, first, last: String
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String
}


