//
//  UserInfoViewController.swift
//  TestAssigment
//
//  Created by user on 2020-04-14.
//  Copyright © 2020 TarasenkoSerhii. All rights reserved.
//

import UIKit

class UserInfoViewController: UITableViewController {
    
    var image = UIImage()
    var firstName: String = ""
    var lastName: String = ""
    var gender: String = ""
    var dateOfBirth: String = ""
    var phoneNumber: String = ""
    

    @IBOutlet weak var userPic: UIImageView!{
        didSet {
            userPic.layer.cornerRadius = userPic.frame.size.height / 2
            userPic.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(firstName)" + " " + "\(lastName)"
        tableView.tableFooterView = UIView(frame: CGRect(x: 0,
                                                         y: 0,
                                                         width: tableView.frame.size.width,
                                                         height: 1))
        
        userPic.image = image
        nameLabel.text = firstName
        lastNameLabel.text = lastName
        genderLabel.text = gender
        dateOfBirthLabel.text = dateOfBirth.convertDate(currentFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ", toFormat: "YYYY-mm-dd")
        phoneNumberLabel.text = phoneNumber
        
        
        
    }
    

}

