//
//  RecosViewController.swift
//  FirebaseTutorial
//
//  Created by Nicolas on 02/04/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//
//
//  RecosViewController.swift
//  FirebaseTutorial
//
//  Created by Nicolas on 02/04/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import AlamofireImage

class RecosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func segmentChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            view1.isHidden = false
            view2.isHidden = true
            break
        case 1:
            view1.isHidden = true
            view2.isHidden = false
            break
        default:
            view1.isHidden = false
            view2.isHidden = true
            break
        }
    }
    
    var products: [Product] = [Product]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tabBarItem = UITabBarItem(title: "Recommendations", image: UIImage(named: "recos"), tag: 3)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let manager = ProductManager()
        manager.fetchProducts{(productsFromJSON) in
            
            self.products = productsFromJSON
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //cb d'elements dans la liste?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    //design de la ligne ?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //cellule prototype depuis le storyboard + réutilisation de cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesTableCell", for: indexPath) as! RecipesTableCell
        let product = products[indexPath.row]
        
        cell.name.text = product.name
        cell.brand.text = product.brand
        cell.score.text = String(product.score)
        cell.posterImageView.af_setImage(withURL: URL(string: product.imageURL)!)
        cell.scoreRound.backgroundColor = product.scoreColor
        
        return cell
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let productViewController = segue.destination as? ProductViewController,
//            let index = tableView.indexPathForSelectedRow?.row
//        else {
//            return
//        }
//        productViewController.barcode = products[index].barcode
//    }
    
    //hauteur de ligne ?
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    //selection de ligne
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
