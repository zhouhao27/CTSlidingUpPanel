//
//  FavoritesVC.swift
//  CTSlidingUpPanel_Example
//
//  Created by Zhou Hao on 8/12/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import CTSlidingUpPanel

class FavoritesVC: UIViewController, CTBottomSlideDelegate {

    weak var parentView: UIView!
    weak var bottomView: UIView!
    var bottomController:CTBottomSlideController?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bottomController = CTBottomSlideController(parent: parentView, bottomView: bottomView, tabController: nil, navController:  nil, visibleHeight: 200)
        
        
        bottomController?.setAnchorPoint(anchor: 0.6)
        bottomController?.delegate = self;
        
        bottomController?.onPanelExpanded = {
            print("Panel Expanded in closure")
        }
        
        bottomController?.onPanelCollapsed = {
            print("Panel Collapsed in closure")
        }
        
        bottomController?.onPanelMoved = { offset in
            print("Panel moved in closure " + offset.description)
        }
        
        //Uncomment to specify top margin on expanded panel
        bottomController?.setExpandedTopMargin(pixels: 200)
        
        if bottomController?.currentState == .collapsed
        {
            //do anything, i don't care
        }
    }
    

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        bottomController?.viewWillTransition(to: size, with: coordinator)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didPanelCollapse()
    {
        print("Collapsed");
    }
    func didPanelExpand(){
        print("Expanded")
    }
    func didPanelAnchor(){
        print("Anchored")
    }
    
    func didPanelMove(panelOffset: CGFloat)
    {
        print(panelOffset);
    }
}
