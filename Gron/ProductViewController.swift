//
//  ProductViewController.swift
//  FirebaseTutorial
//
//  Created by Amélie Grosjean on 04/04/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Produit"

        // Do any additional setup after loading the view.
    }
    
    
//    let apiRoute: String = "https://fr.openfoodfacts.org/api/v0/produit/" + code + ".json"
//    Alamofire.request(apiRoute, encoding: JSONEncoding.default)
//    .responseJSON { response in
//    
//    // Transform JSON to data
//    if((response.result.value) != nil) {
//    let swiftyJsonVar = JSON(response.result.value!)
//    if let productName: String = swiftyJsonVar["product"]["product_name"].string {
//    print (productName)
//    }
//    }
//    print ("tried to change view")
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
