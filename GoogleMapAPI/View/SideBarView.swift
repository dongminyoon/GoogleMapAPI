//
//  SideBarView.swift
//  GoogleMapAPI
//
//  Created by 윤동민 on 26/09/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class SideBarView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor(red: 54/255, green: 55/255, blue: 56/255, alpha: 1.0)
        self.clipsToBounds = true
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
