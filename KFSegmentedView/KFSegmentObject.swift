//
//  KFSegmentObject.swift
//  KFSegmentedView
//
//  Created by Hootan on 9/7/19.
//  Copyright © 2019 Hootan Moradi. All rights reserved.
//

import Foundation

struct KFSegmentObject<T:AnyObject> {
    var model:T
    var index:Int
    var title:String
    var buttonSetting:KFSetting
}
