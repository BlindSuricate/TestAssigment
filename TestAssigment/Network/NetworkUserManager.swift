//
//  NetworkUserManager.swift
//  TestAssigment
//
//  Created by user on 2020-04-14.
//  Copyright © 2020 TarasenkoSerhii. All rights reserved.
//

import Foundation

struct NetworkUserManager {
    
    public func fetchUser (completionHandler: @escaping (User) -> Void ){
        let urlString = "https://randomuser.me/api/"
        guard let userUrl = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: userUrl) { (data, response, error) in
            if let data = data {
//                let dataString = String(data: data, encoding: .utf8)
//                print(dataString!)
                if  let user = self.parseJSON(withData: data){
                completionHandler(user)
            }
                
            }
            
            
        }
        task.resume()
        
    }
    
    func parseJSON(withData data: Data) -> User?  {
        
        let decoder = JSONDecoder()
        do {
            let userData = try decoder.decode(UserData.self, from: data)
            guard let user = User(userData: userData) else { return nil}
            return user
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
        
    }
    
    
    
}
