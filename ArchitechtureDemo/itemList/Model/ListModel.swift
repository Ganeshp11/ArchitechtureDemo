//
//  ListModel.swift
//  ArchitechtureDemo
//
//  Created by Neosoft on 10/03/22.
//

import Foundation

//struct APIServiceHeader: Codable {
//    var version: String?
//    var serviceName: String?
//    var timestamp: String?
//}
//
//struct APIServiceModel<T: Codable>: Codable {
//    var header: APIServiceHeader?
//    var body: T?
//}
//
//struct ListResponse: Codable {
//    var APIService : APIServiceModel<ListModel>?
//}

struct ListModel: Codable {
    let status: Int?
    let data: [ListData]?
    
    init(from decoder: Decoder) throws {
    
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        data = try values.decodeIfPresent([ListData].self, forKey: .data)
    }
}

// MARK: - Datum
struct ListData: Codable {
    let id, productCategoryID: Int?
    let name, producer, datumDescription: String?
    let cost, rating, viewCount: Int?
    let created, modified: Date?
    let productImages: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case productCategoryID = "product_category_id"
        case name = "name"
        case producer = "producer"
        case datumDescription = "description"
        case cost = "cost"
        case rating = "rating"
        case viewCount = "view_count"
        case created = "created"
        case modified = "modified"
        case productImages = "product_images"
    }
//    init(from decoder: Decoder) throws {
//        
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        productCategoryID = try values.decodeIfPresent(Int.self, forKey: .productCategoryID)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//        producer = try values.decodeIfPresent(String.self, forKey: .producer)
//        datumDescription = try values.decodeIfPresent(String.self, forKey: .datumDescription)
//        cost = try values.decodeIfPresent(Int.self, forKey: .cost)
//        rating = try values.decodeIfPresent(Int.self, forKey: .rating)
//        viewCount = try values.decodeIfPresent(Int.self, forKey: .viewCount)
////        created = try values.decodeIfPresent(String.self, forKey: .created)
////        modified = try values.decodeIfPresent(String.self, forKey: .modified)
//        productImages = try values.decodeIfPresent(String.self, forKey: .productImages)
//    }
}
