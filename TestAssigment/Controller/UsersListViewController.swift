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
        title = "Loading users info..."
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        
        makeListOfUsers()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.title = "Users"
            self.tableView.reloadData()
        }
        
        
        
    }
    
    func makeListOfUsers() {
        DispatchQueue.main.async {
            self.networkUserManager.onCompletion = {usersList in
                self.users = usersList
            }
            self.networkUserManager.takeListOfUsers(howManyUsers: self.numbersOfUsersInList)
            
        }
    }
    
    func fetchImage (fromUrl url: String) -> UIImage? {
        guard let url = URL(string: url), let imageData = try? Data(contentsOf: url) else { return nil }
        
        let image = UIImage(data: imageData)
        
        return image
    }
    
    
 
    
}

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
        cell.userPhoneNumber.text = user.phoneNumber
        if indexPath.row == self.users.count {
            print("the end of list")
        }
        return cell
 }
    
    
}

extension UsersListViewController: UITableViewDelegate {
    
}

extension UsersListViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
            
      print("prefetching row of \(indexPaths)")
    }
        
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
            
      print("cancel prefetch row of \(indexPaths)")
    }
}
