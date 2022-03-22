//
//  GetMethod.swift
//  ArchitechtureDemo
//
//  Created by Neosoft on 22/03/22.
//

import Foundation
import KeychainSwift

struct GetMethod {
    let keychain = KeychainSwift()
    func getData(url: String,method: String, parametre: [String: Any], header: Bool, completion: @escaping(Result<Any>) -> Void) {
        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            request.httpMethod = method
        
            
            if (header) {
                request.setValue(keychain.get("access_token"), forHTTPHeaderField: "access_token")
            }
            
            if !(parametre.isEmpty) {
                let parametres: [String: Any] = parametre
                request.httpBody = parametres.percentEscaped().data(using: .utf8)
            }
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    if error == nil{
                        print(error?.localizedDescription ?? "Unknown Error")
                    }
                    return
                }
                
                if let response = response as? HTTPURLResponse{
                    guard (200 ... 299) ~= response.statusCode else {
                        print("Status code :- \(response.statusCode)")
                        
                        return
                    }
                    completion(.success(data))
                    print(data)
                }
                do{
                    // old type
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    
                } catch let error{
                    print(error.localizedDescription)
                }
                do {
                    //create json object from data
                    if (try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]) != nil {
                        //                        completion(.success(data))
                    }
                } catch let error {
                    print(error.localizedDescription)
                    completion(.error(error.localizedDescription))
                }

                
//                do {// new type
//                    let jsonDecoder = JSONDecoder()
//                    let  responseModel = try jsonDecoder.decode(GetProductDEtailsData.self, from: data)
//                    print(responseModel)
//                    
//                } catch let error {
//                    return completion(.error(error.localizedDescription))
//                }
            }
            task.resume()
        }
    }
}

