//
//  ProductsManager.swift
//  Gron
//
//  Created by Amélie Grosjean on 05/04/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ProductManager: NSObject {
    func fetchProducts(completionHandler: @escaping ([Product])->Void ){
        let url = "https://fr.openfoodfacts.org/label/vegetalien.json"
        
        Alamofire.request(url).responseJSON { (dataResponse) in
            if let realData = dataResponse.data {
                let json = JSON(realData)
                
                var products: [Product] = [Product]()
                
                for productJSON in json["products"].arrayValue {
                    let product = Product(json: productJSON)
                    
                    products.append(product)
                }
                
                completionHandler(products)
            }
        }
    }
}

