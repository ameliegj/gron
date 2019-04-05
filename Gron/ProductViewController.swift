//
//  ProductViewController.swift
//  FirebaseTutorial
//
//  Created by Amélie Grosjean on 04/04/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON



class ProductViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Produit"
        
//        let barcode: Int

        let apiRoute: String = "https://fr.openfoodfacts.org/api/v0/produit/3057640238703.json"
        Alamofire.request(apiRoute, encoding: JSONEncoding.default)
            .responseJSON { response in
                
                // Transform JSON to data
                if((response.result.value) != nil) {
                    let swiftyJsonVar = JSON(response.result.value!)
                    if let productName: String = swiftyJsonVar["product"]["product_name"].string {
                        self.productNameLabel.text = productName
                    }
                    if let brandName: String = swiftyJsonVar["product"]["brands"].string {
                        self.brandLabel.text = brandName
                    }
                }
                print ("tried to change view")
        }
        
        

    }
        // Do any additional setup after loading the view.
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    
//    let code = 3057640238703

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
