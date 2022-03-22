//
//  ListViewController.swift
//  ArchitechtureDemo
//
//  Created by Neosoft on 10/03/22.
//

import UIKit

class ListViewController: UIViewController {

    
    

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var listTable: UITableView!
    private lazy var listViewModel : ProductListViewModel = {
        
        return ProductListViewModel()
    }()
   
    let parametres: [String : Any] = [
       "product_category_id": 1,
        "page" : 1,
        "limit": 10
    ]
    var tableProductId: Int?
    var getProductDEtailsData: ListModel?
    var filteredData: [ListData]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        listTable.delegate = self
//        listTable.dataSource = self
        setupConfiguration()
//        getData()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    func titleSetUp(){
        if (tableProductId == 1) {
            navigationBar.topItem?.title = "Tables"
        } else if (tableProductId == 3) {
            navigationBar.topItem?.title = "Sofa"
        } else if (tableProductId == 2) {
            navigationBar.topItem?.title = "Chair"
        } else if (tableProductId == 4) {
            navigationBar.topItem?.title = "Cupboard"
        }
    }
    
//    func getData(){
//        listViewModel.getProductDetails(product_category_id: "1"){ (data) in
//            DispatchQueue.main.async { [self] in
//                if (data.status == 200){
//                    self.getProductDEtailsData = data
//                    print("Response = \(data)")
////                    self.performSegue(withIdentifier: "tablesFromHomeScreen", sender: self)
//                }
//            }
//
//        }
//    }
    func setupConfiguration(){
        navigationBar.tintColor = .white
        navigationBar.isTranslucent = false
        filteredData = getProductDEtailsData?.data
        listTable.estimatedRowHeight = 280
        listTable.rowHeight = UITableView.automaticDimension
        listTable.separatorStyle = .none
        listTable.tableFooterView = UIView()
        listTable.showsVerticalScrollIndicator = false
        listTable.cellLayoutMarginsFollowReadableWidth = false
        listTable.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableCell")
        listTable.register(UINib.init(nibName: "LoadMoreTableViewCell", bundle: nil), forCellReuseIdentifier: "LoadMoreTableViewCell")
//        getData()
        
    }
}
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableViewCell

        var count = filteredData?[indexPath.row].rating ?? 1

        while (count != 0) {
            cell.starImages?[(count - 1)].image = UIImage(named: "star_check")
            count -= 1
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: false)
//        let productDetailsViewModel = ProductDetailsViewModel()
//
//        let product_id = String(getProductDEtailsData?.data?[indexPath.row].id ?? 1)
//        productDetailsViewModel.getProductDetails(product_id: product_id) { (data) in
//            DispatchQueue.main.async {
//                if (data.status == 200) {
//                    self.showProductDetails = data
//                    self.performSegue(withIdentifier: "productDetailsFromTables", sender: self)
//                }
//            }
//        }
//    }


//private extension ListViewController{
//    func isLoadingCell(for indexPath: IndexPath) -> Bool{
//        return
//        return indexPath.row >= listViewModel.currentCO
//    }
//}


