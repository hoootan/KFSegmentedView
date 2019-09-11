//
//  ViewController.swift
//  segment-test
//
//  Created by Hootan Moradi on 9/10/19.
//  Copyright © 2019 Hootan Moradi. All rights reserved.
//

import UIKit
import KFSegmentedView

class TestClass {}

class ViewController: UIViewController {

    @IBOutlet weak var backView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let setting = KFSetting(font: UIFont.systemFont(ofSize: 14),
                                selectedTextColor: .black,
                                unselectedTextColor: .white,
                                selectedBackgroundColor: .white,
                                unselectedBackgroundColor: .clear,
                                selectedBorderColor: .black,
                                unselectedBorderColor: .clear,
                                borderWidth: 1,
                                cornerRadius: backView.frame.height/2)
        
        let objs = [
            KFSegmentObject(model:TestClass(), index: 0, title: "first", settings: setting),
            KFSegmentObject(index: 1, title: "second", settings: setting),
            KFSegmentObject(index: 2, title: "third", settings: setting),
            KFSegmentObject(index: 3, title: "fourth", settings: setting)
        ]
        
        let segment = KFSegmentedController(delegate: self, items: objs)
        add(child: segment, subview: backView)
        segment.semantic = .rtl
        segment.cornerRadius = backView.frame.height/2
        segment.backgroundColor = .lightGray
        segment.segmentSelectedIndex = 3

    }

}

extension ViewController : KFSegmentedControllerDelegate {
    func segmentedSelectedItem(at index: Int, obj: KFSegmentObject) {
        
    }
}

