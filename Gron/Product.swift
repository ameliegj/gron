//
//  Products.swift
//  Gron
//
//  Created by Amélie Grosjean on 05/04/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import SwiftyJSON

class Product: NSObject {
    var name: String = ""
    var brand: String = ""
    var imageURL: String = ""
    var score: Int = 0
    var scoreColor: UIColor = UIColor.green
    var barcode: Int = 0
    
    init(name: String, brand: String, imageURL: String, score: Int, scoreColor: UIColor, barcode:Int) {
        self.name = name
        self.brand = brand
        self.imageURL = imageURL
        self.score = score
        self.scoreColor = scoreColor
        self.barcode = barcode
    }
    
    init(json: JSON) {
        self.name = json["product_name"].stringValue
        self.brand = json["brands"].stringValue
        self.imageURL = json["image_url"].stringValue
        self.barcode = json["code"].intValue
        
        self.score = Int.random(in: 65 ... 100)
        
        switch score {
        case 65...80:
            self.scoreColor = UIColor.orange
        case 80...100:
            self.scoreColor = UIColor.green
        default:
            self.scoreColor = UIColor.green
        }
    }
}
