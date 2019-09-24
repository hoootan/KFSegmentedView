//
//  KFButton.swift
//  KFSegmentedView
//
//  Created by Hootan on 9/8/19.
//  Copyright © 2019 Hootan Moradi. All rights reserved.
//

import UIKit

protocol KFSegmentedButtonDelegate {
    func didSelect(at index:Int,with obj:KFSegmentObject)
}

protocol KFSegmentedButtonLogic {
    func setColorForSelectedButton()
    func setColorForUnselectedButton()
}

public class KFButton: UIButton, KFSegmentedButtonLogic {
    
    var delegate: KFSegmentedButtonDelegate!
    private var buttonSetting: KFSetting!
    public var object:KFSegmentObject! {
        didSet {
            setTitle(object.title, for: .normal)
            addTarget(self, action: #selector(didSelectAction), for: .touchUpInside)
        }
    }
    
    var labelFont: UIFont {
        get { return buttonSetting.labelFont ?? UIFont.systemFont(ofSize: 14) }
    }
    
    var selectedTextColor: UIColor {
        get { return buttonSetting.selectedTextColor }
    }
    
    var unselectedTextColor: UIColor {
        get { return buttonSetting.unselectedTextColor }
    }

    var selectedBackgroundColor: UIColor {
        get { return buttonSetting.selectedBackgroundColor }
    }

    var unselectedBackgroundColor: UIColor {
        get { return buttonSetting.unselectedBackgroundColor }
    }

    var selectedBorderColor: UIColor {
        get { return buttonSetting.selectedBorderColor }
    }

    var unselectedBorderColor: UIColor {
        get { return buttonSetting.unselectedBorderColor }
    }
    
    var borderWidth: CGFloat {
        get { return buttonSetting.borderWidth ?? 0 }
    }
    
    var cornerRadius: CGFloat {
        get { return buttonSetting.cornerRadius ?? 0 }
    }
    
    public init(setting:KFSetting) {
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
        setTitleColor(selectedTextColor, for: .normal)
        titleLabel?.font = labelFont
        backgroundColor = selectedBackgroundColor
        layer.borderColor = selectedBorderColor.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func setColorForUnselectedButton() {
        setTitleColor(unselectedTextColor, for: .normal)
        backgroundColor = unselectedBackgroundColor
        titleLabel?.font = labelFont
        layer.borderColor = unselectedBorderColor.cgColor
        layer.borderWidth = borderWidth
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }

}
