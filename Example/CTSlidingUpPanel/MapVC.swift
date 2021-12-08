//
//  MapVC.swift
//  CTSlidingUpPanel_Example
//
//  Created by Zhou Hao on 8/12/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var favoritesViewContainer: UIView!
    
    // TODO: We can add more container and child view controller
    var favoritesVC: FavoritesVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.destination {
        
        case let viewController1 as FavoritesVC:
            self.favoritesVC = viewController1
            self.favoritesVC.parentView = self.view
            self.favoritesVC.bottomView = favoritesViewContainer
            
//        case let viewController2 as ViewController2:
//            self.viewController2 = viewController2
//
//        case let viewController3 as ViewController3:
//            self.viewController3 = viewController3
            
        default:
            break
        }
    }
}
