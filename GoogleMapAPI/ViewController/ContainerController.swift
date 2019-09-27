//
//  MenuController.swift
//  GoogleMapAPI
//
//  Created by 윤동민 on 26/09/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

extension NSNotification.Name {
    static let touchSideBar = NSNotification.Name("touchedSideBar")
}

class ContainerController: UIViewController {
    @IBOutlet weak var sideMenuLeadingConstraint: NSLayoutConstraint!
    var isOpenMenu = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: .touchSideBar, object: nil)
    }
    
    @objc func toggleSideMenu() {
        if isOpenMenu {
            isOpenMenu = false
            sideMenuLeadingConstraint.constant = -265
        }
        else {
            isOpenMenu = true
            sideMenuLeadingConstraint.constant = 0
        }
    }
}
