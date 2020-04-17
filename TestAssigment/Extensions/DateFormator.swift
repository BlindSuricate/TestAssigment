//
//  DateFormator.swift
//  TestAssigment
//
//  Created by user on 2020-04-17.
//  Copyright © 2020 TarasenkoSerhii. All rights reserved.
//

import Foundation

 extension String {

    func convertDate(currentFormat: String, toFormat : String) ->  String { 
        let dateFormator = DateFormatter()
        dateFormator.dateFormat = currentFormat
        let resultDate = dateFormator.date(from: self)
        dateFormator.dateFormat = toFormat
        return dateFormator.string(from: resultDate!)
    }
}
