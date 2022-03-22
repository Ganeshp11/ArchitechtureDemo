//
//  PostMethod.swift
//  ArchitechtureDemo
//
//  Created by Neosoft on 22/03/22.
//

import Foundation
import KeychainSwift

struct PostMethod {
    let keychain = KeychainSwift()
    
    func postData(url: String,method: String, parametre: [String: Any], header: Bool, completion: @escaping(Result<Any>) -> Void) {
        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            request.httpMethod = method
            
            request.httpBody = parametre.percentEscaped().data(using: .utf8)
            if (header) {
                request.setValue(keychain.get("access_token"), forHTTPHeaderField: "access_token")
            }
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    if error == nil{
                        print(error?.localizedDescription ?? "Unknown Error")
                    }
                    return
                }
                
                if let response = response as? HTTPURLResponse{
                    
                    guard (200 ... 500) ~= response.statusCode else {
                        print("Status code :- \(response.statusCode)")
                        print(response)
                        return
                    }
                }

                do{
                    // old type
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)

                }catch let error{
                    print(error.localizedDescription)
                }
                do {
                    //create json object from data
                    if (try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]) != nil {
                        completion(.success(data))
                    }
                } catch let error {
                    print(error.localizedDescription)
                    completion(.error(error.localizedDescription))
                }
//                do {
//                    let json = try JSONDecoder().decode(JSONData.self, from: data)
//                    completion(.success(json))
//                } catch let error {
//                    completion(.error(error.localizedDescription))
//                }
            }.resume()
        }
    }
}
enum Result<T>{
    case success(T)
    case error(String)
}
