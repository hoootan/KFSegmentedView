//
//  KFSetting.swift
//  KFSegmentedView
//
//  Created by Hootan on 9/8/19.
//  Copyright © 2019 Hootan Moradi. All rights reserved.
//

import UIKit

public struct KFSetting {
    var labelFont: UIFont?
    var selectedTextColor: UIColor
    var unselectedTextColor: UIColor
    var selectedBackgroundColor: UIColor
    var unselectedBackgroundColor: UIColor
    var selectedBorderColor: UIColor
    var unselectedBorderColor: UIColor
    var borderWidth:CGFloat?
    var cornerRadius:CGFloat?
    
    public init(font:UIFont? = nil,
        selectedTextColor:UIColor,
        unselectedTextColor:UIColor,
        selectedBackgroundColor: UIColor,
        unselectedBackgroundColor: UIColor,
        selectedBorderColor: UIColor,
        unselectedBorderColor: UIColor,
        borderWidth:CGFloat? = 0,
        cornerRadius:CGFloat? = 0) {
        
        self.labelFont = font
        self.unselectedTextColor = unselectedTextColor
        self.selectedTextColor = selectedTextColor
        self.unselectedBorderColor = unselectedBorderColor
        self.selectedBorderColor = selectedBorderColor
        self.unselectedBackgroundColor = unselectedBackgroundColor
        self.selectedBackgroundColor = selectedBackgroundColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
    }
}
