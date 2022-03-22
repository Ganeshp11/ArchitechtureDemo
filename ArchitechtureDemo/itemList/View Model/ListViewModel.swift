//
//  ListViewModel.swift
//  ArchitechtureDemo
//
//  Created by Neosoft on 10/03/22.
//

import Foundation
import UIKit
import Alamofire

class ProductListViewModel {
    var getProductailsData: ListModel?
    var currentPage = 1

    func getProductDetails(product_category_id: String, completionHandler:@escaping (ListModel)->Void){
        var urlComponents = URLComponents(string: "http://staging.php-dev.in:8844/trainingapp/api/products/getList")
        urlComponents!.queryItems = [ URLQueryItem(name: "product_category_id", value: "\(product_category_id)")]
            
        urlComponents!.percentEncodedQuery = urlComponents!.percentEncodedQuery!.replacingOccurrences(of: "+", with: "%2B")
        guard let url = urlComponents?.url?.absoluteString else { print("no url found")
            return }
        let getMethod = GetMethod()
        let method = "GET"
        let parametres:[String: Any] = [:]
        
        let header = false
        getMethod.getData(url: url,
                          method: method,
                          parametre: parametres,
                          header: header) { (result) in
                            
                            switch result {
                            case .success(let data):
                                let data2 = data as! Foundation.Data
                                do{
                                    self.getProductailsData = try JSONDecoder().decode(ListModel.self, from: data2)
                                    guard  let responseData = self.getProductailsData else {return}
                                    completionHandler(responseData)
                                    
                                } catch {
                                    print("failed to load data")
                                }
                            case .error(let message):
                                print(message)
                            }
        }
    }
}

//class ListViewModel {
//    var getProductData: ListModel?
//
//    var currentPage = 1
////    var currentCount: Int{
////        return ListData.count
////    }
//    func getProductDetails(completionHandler: @escaping (ListModel) -> Void){
//
//        let parameteres: [String : Any] = [
//           "product_category_id": "1",
//            "page" : currentPage,
//            "limit": 10
//        ]
//        WebServiceManager().requestAPI(serviceEndpoint: .list, parameters: parameteres, isHud: true) { (result) in
//
//            switch result {
//            case .success(let data):
//                let data2 = data as! Foundation.Data
//                do{
//                    self.getProductData = try JSONDecoder().decode(ListModel.self, from: data2)
//                    guard  let responseData = self.getProductData else {return}
//                    completionHandler(responseData)
//                    print(responseData)
//                    print(data)
//
//                } catch {
//                    print("failed to load data")
//                }
//            case .error(let message):
//                print(message)
//            }
//}
//
//    }
//}
//class ListViewModel{
//    var listModel: ListModel?
//    var listData = [ListData]()
//
//    private lazy var listService : ListService = {
//        return ListService()
//    }()
//    var totalCount = 0
//
//    var currentCount: Int{
//        return listData.count
//    }
//    var currentPage = 1
//    private var isFetchInProgress = false
//
//    internal func list(product_category_id: String, completion: @escaping (Result<ListData,APIError>) -> Void ){
//        guard !isFetchInProgress else{
//            return
//        }
//        isFetchInProgress = true
//        let request: [String : Any] = [
//            "page" : currentPage,
//            "limit": 10
//        ]
//
//        print(request)
//        listService.getList(dict: request, completionHandler: { (response) in
//            switch response {
//            case .success(let listdata):
//                completion(.success(listdata?.data))
//
////    func createlistViewModel(list: [ListData]){
////        for model in list{
////            self.listModel.append(model)
////        }
////    }
//
//    func noOfRows(for section: Int) ->Int {
//        return (totalCount > listModel.count) ? listModel.count + 1 : listModel.count
//        }
//}
//}
