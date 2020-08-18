//
//  AlertController.swift
//  CollectionViewWithHeader
//
//  Created by Aijaz Ali on 18/08/2020.
//  Copyright © 2020 IT Majlis2019. All rights reserved.
//

import Foundation
import UIKit
 class AlertController{
    static let sharedAlert:AlertController = AlertController()
    func setAlert(alertTitle:String,alertMSG:String,alertController:UIViewController){
           let alert = UIAlertController(title: alertTitle, message: alertMSG, preferredStyle: UIAlertController.Style.alert)
           alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
           alertController.present(alert, animated: true, completion: nil)
       }
}
