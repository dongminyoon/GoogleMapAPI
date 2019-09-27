//
//  SideMenuController.swift
//  GoogleMapAPI
//
//  Created by 윤동민 on 26/09/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class SideMenuController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected Row: \(indexPath.row)")
    }
}
