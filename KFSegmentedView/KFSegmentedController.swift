//
//  KFSegmentedController.swift
//  KFSegmentedView
//
//  Created by Hootan on 9/7/19.
//  Copyright © 2019 Hootan Moradi. All rights reserved.
//

import UIKit

protocol KFSegmentedControllerDelegate: class {
    func segmentedSelectedItem(at index:Int, obj:KFSegmentObject<AnyObject>)
    func segmentedUnSelectedItem(at index:Int, obj:KFSegmentObject<AnyObject>)
}

class KFSegmentedController: UIViewController {
    
    weak var delegate: KFSegmentedControllerDelegate?
    
    @IBOutlet weak private var backgroundView: UIView!
    @IBOutlet weak private var segmentStackView: KFSegmentedStackView!
    
    public var objects:[KFSegmentObject<AnyObject>]!
    public var backgroundColor: UIColor {
        get { return .white }
        set { backgroundView.backgroundColor = newValue }
    }
    
    public var cornerRadius: CGFloat {
        get { return 0 }
        set { self.backgroundView.layer.cornerRadius = newValue }
    }
    
    init(delegate:KFSegmentedControllerDelegate) {
        print("KFSegmentedController init")
        super.init(nibName: "KFSegmentedController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("coder ofn KFSegmentedController not implemnted")
    }
    
    deinit {
        print("KFSegmentedController deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        self.configureStackView()
    }
    
    private func initUI() {
        self.backgroundView.backgroundColor = backgroundColor
        self.backgroundView.layer.cornerRadius = cornerRadius
        self.backgroundView.layer.masksToBounds = true
    }
    
    private func configureStackView() {
        objects.forEach { (segmentObj) in
            let customButton = KFButton(setting: segmentObj.buttonSetting)
            customButton.delegate = self
            customButton.object = segmentObj
            segmentStackView.addArrangedSubview(customButton)
        }
    }
    
}

extension KFSegmentedController: KFSegmentedButtonDelegate {
    func didSelect(at index: Int, with obj: KFSegmentObject<AnyObject>) {
        let selectedButton = segmentStackView.arrangedSubviews[index] as! KFButton
        selectedButton.setColorForSelectedButton()
        delegate?.segmentedSelectedItem(at: index, obj: obj)
    }
    
    func didUnselect(at index: Int, with obj: KFSegmentObject<AnyObject>) {
        let selectedButton = segmentStackView.arrangedSubviews[index] as! KFButton
        selectedButton.setColorForUnselectedButton()
        delegate?.segmentedUnSelectedItem(at: index, obj: obj)
    }
}
