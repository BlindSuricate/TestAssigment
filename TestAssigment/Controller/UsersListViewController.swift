//
//  UsersViewController.swift
//  TestAssigment
//
//  Created by user on 2020-04-14.
//  Copyright © 2020 TarasenkoSerhii. All rights reserved.
//

import UIKit

class UsersListViewController: UIViewController {
    
    var networkUserManager = NetworkUserManager()
    
    var users:[User] = []
    var numbersOfUsersInList = 20
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        DispatchQueue.main.async {
            self.networkUserManager.onCompletion = {usersList in
                self.users = usersList
                //print(usersList)
            }
            self.networkUserManager.takeListOfUsers(howManyUsers: self.numbersOfUsersInList)
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.tableView.reloadData()
        }
        
        
        
    }
    
    func fetchImage (fromUrl url: String) -> UIImage? {
        guard let url = URL(string: url), let imageData = try? Data(contentsOf: url) else { return nil }
        
        let image = UIImage(data: imageData)
        
        return image
    }
    
    
 
    
}

extension UsersListViewController: UITableViewDelegate {}

extension UsersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
       cell.frame.size.height = 100
        
        
        let user = users[indexPath.row]
        
        cell.userImage.image = fetchImage(fromUrl: user.image)
        cell.userName.text = user.firstName
        cell.userLastName.text = user.lastName
        return cell
        
    }
    
    
}
