//
//  UIViewController+Sidebar.swift
//  TheraConnect
//
//  Created by CC Katz on 10/8/18.
//  Copyright © 2018 CC Katz. All rights reserved.
//

import Foundation

extension UIViewController {
    func setUpSidebar () {
        
        if self.revealViewController() != nil {
            self.revealViewController().rearViewRevealWidth =
                self.view.frame.width - 64
            self.navigationItem.leftBarButtonItem =
                self.editButtonItem
            self.editButtonItem.target = self.revealViewController ()
            self.editButtonItem.action =
                #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

    }
    
    }
}
