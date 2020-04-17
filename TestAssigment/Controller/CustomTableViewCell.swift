//
//  CustomTableViewCell.swift
//  TestAssigment
//
//  Created by user on 2020-04-17.
//  Copyright © 2020 TarasenkoSerhii. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView! {
        didSet {
            userImage.layer.cornerRadius = userImage.frame.size.height / 2
            userImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userLastName: UILabel!
    
}
