//
//  KFSegmentObject.swift
//  KFSegmentedView
//
//  Created by Hootan on 9/7/19.
//  Copyright © 2019 Hootan Moradi. All rights reserved.
//

import Foundation

public struct KFSegmentObject {
    var model:AnyObject?
    var index:Int
    var title:String
    var buttonSetting:KFSetting
    
    public init(model:AnyObject? = nil, index:Int, title:String, settings:KFSetting) {
        self.model = model
        self.title = title
        self.buttonSetting = settings
        self.index = index
    }
    
}
