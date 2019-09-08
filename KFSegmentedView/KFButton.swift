//
//  KFButton.swift
//  KFSegmentedView
//
//  Created by Hootan on 9/8/19.
//  Copyright © 2019 Hootan Moradi. All rights reserved.
//

import UIKit

protocol KFSegmentedButtonDelegate {
    func didSelect(at index:Int,with obj:KFSegmentObject<AnyObject>)
    func didUnselect(at index:Int,with obj:KFSegmentObject<AnyObject>)
}

protocol KFSegmentedButtonLogic {
    func setColorForSelectedButton()
    func setColorForUnselectedButton()
}

class KFButton: UIButton, KFSegmentedButtonLogic {
    
    public var delegate: KFSegmentedButtonDelegate!
    private var buttonSetting: KFSetting!
    public var object:KFSegmentObject<AnyObject>! {
        didSet {
            setTitle(object.title, for: .normal)
            addTarget(self, action: #selector(didSelectAction), for: .touchUpInside)
        }
    }
    
    var labelFont: UIFont {
        get { return buttonSetting.labelFont }
        set { self.titleLabel?.font = newValue }
    }
    
    var textColor: UIColor {
        get { return buttonSetting.textColor }
        set { self.tintColor = newValue }
    }
    
    var unselectedColor: UIColor {
        get { return buttonSetting.unselectedColor }
        set { setTitleColor(newValue, for: .normal) }
    }

    var selectedColor: UIColor {
        get { return buttonSetting.selectedColor }
        set { setTitleColor(newValue, for: .normal) }
    }

    var selectedBorderColor: UIColor {
        get { return buttonSetting.selectedBorderColor }
        set { layer.borderColor = newValue.cgColor }
    }

    var unselectedBorderColor: UIColor {
        get { return buttonSetting.unselectedBorderColor }
        set { layer.borderColor = newValue.cgColor }
    }
    
    init(setting:KFSetting) {
        super.init(frame: .zero)
        self.buttonSetting = setting
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didSelectAction() {
        self.delegate?.didSelect(at: self.object.index, with: object)
    }
    
    func setColorForSelectedButton() {
        backgroundColor = .white
        layer.borderColor = selectedBorderColor.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 14.0
        layer.masksToBounds = true
    }
    
    func setColorForUnselectedButton() {
        backgroundColor = .clear
        layer.borderColor = unselectedBorderColor.cgColor
        layer.borderWidth = 0
    }
    
}
