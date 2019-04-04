//
//  ScanViewController.swift
//  FirebaseTutorial
//
//  Created by Nicolas on 02/04/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import BarcodeScanner
import Alamofire
import SwiftyJSON

class ScanViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool){
    
        let viewController = BarcodeScannerViewController()
        viewController.codeDelegate = self
        viewController.errorDelegate = self
        viewController.dismissalDelegate = self
        present(viewController, animated: true, completion: nil)        // Do any additional setup after loading the view.
    }
    
    private func makeBarcodeScannerViewController() -> BarcodeScannerViewController {
        let viewController = BarcodeScannerViewController()
        viewController.codeDelegate = self as? BarcodeScannerCodeDelegate
        viewController.errorDelegate = self as? BarcodeScannerErrorDelegate
        viewController.dismissalDelegate = self as? BarcodeScannerDismissalDelegate
        return viewController
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tabBarItem = UITabBarItem(title: "Scan", image: UIImage(named: "scan"), tag: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destinationViewController.
         Pass the selected object to the new view controller.xs
    }
    */

}


extension ScanViewController: BarcodeScannerCodeDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        print("Barcode Data: \(code)")
        print("Symbology Type: \(type)")
        
//        //display ProductViewController
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
//        self.navigationController?.pushViewController(nextViewController, animated: true)
//        controller.dismiss(animated: true, completion: nil)
//        print("dismiss")
//        self.tabBarController?.selectedIndex = 0
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let productViewController = storyBoard.instantiateViewController(withIdentifier: "product") as! ProductViewController
        self.present(productViewController, animated: true, completion: nil)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            controller.resetWithError()
        }
        
        
    }
}


extension ScanViewController: BarcodeScannerErrorDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        print("error : \(error)")
    }
}

extension ScanViewController: BarcodeScannerDismissalDelegate {
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
        print("dismiss")
        self.tabBarController?.selectedIndex = 0
    }
}




//                func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
//                    print("oui")
//                    controller.dismiss(animated: true, completion: nil)
//
//                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
////
//                    print(nextViewController)
//
//                    print("dismiss")
//                    self.tabBarController?.selectedIndex = 0

//                    self.navigationController?.pushViewController(nextViewController, animated: true)

//                }

