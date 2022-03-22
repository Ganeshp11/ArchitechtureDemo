////
////  Post.swift
////  ArchitechtureDemo
////
////  Created by Neosoft on 22/03/22.
////
//
//import Foundation
//class Post {
//
//    static var post = Post()
//    
//    func post() {
//        let postRequest = NSMutableURLRequest(url: NSURL(string: "http://staging.php-dev.in:8844/trainingapp/api/users/register")! as URL)
//        postRequest.httpMethod = "POST"
//        
//        let register = Register.shared
//        let first_name = register.firstNameTextField.text
//        let last_name = register.lastNameTextField.text
//        let email = register.emailTextField.text
//        let password = register.passwordTextField.text
//        let confirm_password = register.confirmPasswordTextField.text
//        let phone_no = register.phoneNumberTextField.text
//        
////        let postString: [String: Any] = ["first_name" : first_name!,
////                                         "last_name" : last_name!,
////                                         "email" : email!,
////                                         "password" : password!,
////                                         "confirm_password" : confirm_password!,
////                                         "gender" : "M",
////                                         "phone_no" : phone_no!]
//        
//        let postString: [String: Any] = ["first_name" : "Michael",
//                                         "last_name" : "Jordan",
//                                         "email" : "mjordan@gmail.com",
//                                         "password" : "mj@123",
//                                         "confirm_password" : "mj@123",
//                                         "gender" : "M",
//                                         "phone_no" : "9987654321"]
//        
//        postRequest.httpBody = postString.percentEscaped().data(using: .utf8)
//
//        URLSession.shared.dataTask(with: postRequest as! URLRequest) { (data, response, error) in
//            guard let data = data else {
//                if error != nil{
//                    print(error?.localizedDescription ?? "Unknown Error")
//                }
//                return
//            }
//            
//            if let response = response as? HTTPURLResponse {
//                guard (200 ... 299) ~= response.statusCode else {
//                    print("Status Code :- \(response.statusCode)")
//                    print("\(response)")
//                    return
//                }
//            }
//            
//            do {
//                let jSon = try JSONSerialization.jsonObject(with: data, options: [])
//                print(jSon)
//            } catch let error {
//                print(error.localizedDescription)
//            }
//            do {
//                let decoder = JSONDecoder()
//                let jSon = try decoder.decode(JSONData.self, from: data)
//                print(jSon)
//            } catch let error {
//                print(error.localizedDescription)
//                return 
//            }
//        }.resume()
//    }
//}
//
//
//
