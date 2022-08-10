//
//  UsersServiceable.swift
//  BM
//
//  Created by NikitaSergeevich on 10/08/2022.
//

import Foundation

//protocol UsersServiceable {
//    func getAllUsers() async -> Result<[User], RequestError>
//}

class UserService: ObservableObject {
//    func getAllUsers() async -> Result<[User], RequestError> {
//        return await sendRequest(endpoint: UsersEndpoint.allUsers, responseModel: [User].self)
//    }
    
//    @Published var users: [User] = []
    
    func getUsers() async throws -> [User] {
        print("qqq", 1)
        guard let url = URL(string: "http://127.0.0.1:8080/api/users")else{fatalError("Missing URL")}
//        let urlRequest = URLRequest(url: url)
        
//        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//            if let error = error {
//                print("Request error", error)
//                return
//            }
//            guard let response = response as? HTTPURLResponse else {return}
//
//            if response.statusCode == 200 {
//                guard let data = data else {return}
//                DispatchQueue.main.async {
//                    do {
//                        let decodedUsers = try JSONDecoder().decode([User].self, from: data)
//                        self.users = decodedUsers
//                    } catch let error {
//                        print("Error decoding", error)
//                    }
//                }
//            }
//        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        print("qqq", 2, data)
        
        
//        do {
//        let userResult = try JSONDecoder().decode(UserResult.self, from: data)
//            print(userResult.path[0])
//            print("qqq", 3)
//            return userResult.path
//
//        } catch {
//            print("error decode", error.localizedDescription)
//            return [User]()
//        }
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        
        do {
            let userResult = try decoder.decode([User].self, from: data)
            return userResult
        } catch {
            print("error decode", error.localizedDescription)
            return [User]()
        }
        
    }
    
}
