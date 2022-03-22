//
//  Extensions.swift
//  ArchitechtureDemo
//
//  Created by Neosoft on 22/03/22.
//

import Foundation
import UIKit

extension Dictionary{
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
            }
            .joined(separator: "&")
    }
}
extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalisedDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = ":$&'()*+,;="
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalisedDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
