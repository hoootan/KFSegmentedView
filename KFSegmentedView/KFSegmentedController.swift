//
//  KFSegmentedController.swift
//  KFSegmentedView
//
//  Created by Hootan on 9/7/19.
//  Copyright © 2019 Hootan Moradi. All rights reserved.
//

import UIKit

public enum SegmentSemantic {
    case rtl
    case ltr
}

public protocol KFSegmentedControllerDelegate: class {
    func segmentedSelectedItem(at index:Int, obj:KFSegmentObject)
}

public class KFSegmentedController: UIViewController {
    
    weak var delegate: KFSegmentedControllerDelegate?
    
    @IBOutlet weak private var backgroundView: UIView!
    @IBOutlet weak private var segmentStackView: KFSegmentedStackView!
    
    private var objects:[KFSegmentObject]!
    
    public var backgroundColor: UIColor {
        get { return .white }
        set { self.backgroundView.backgroundColor = newValue }
    }
    
    public var segmentSelectedIndex: Int = 0 {
        didSet {
            let selectedButton = segmentStackView.arrangedSubviews[segmentSelectedIndex] as! KFButton
            selectedButton.didSelectAction()
        }
    }
    
    public var semantic: SegmentSemantic = .ltr {
        didSet {
            switch semantic {
            case .ltr:
                segmentStackView.semanticContentAttribute = .forceLeftToRight
            case .rtl:
                segmentStackView.semanticContentAttribute = .forceRightToLeft
            }
        }
    }
    
    public var cornerRadius: CGFloat {
        get { return 0 }
        set { self.backgroundView.layer.cornerRadius = newValue }
    }
    
    public init(delegate:KFSegmentedControllerDelegate, items:[KFSegmentObject]) {
        print("KFSegmentedController init")
        super.init(nibName: "KFSegmentedController", bundle: nil)
        self.delegate = delegate
        self.objects = items
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("coder ofn KFSegmentedController not implemnted")
    }
    
    deinit {
        print("KFSegmentedController deinit")
    }
    
    override public func viewDidLoad() {
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
    func didSelect(at index: Int, with obj: KFSegmentObject) {
        let selectedButton = segmentStackView.arrangedSubviews[index] as! KFButton
        selectedButton.setColorForSelectedButton()
        let unselectButtons = (segmentStackView.arrangedSubviews as! [KFButton]).filter({ $0.object.index != index })
        unselectButtons.forEach { (btn) in btn.setColorForUnselectedButton()}
        delegate?.segmentedSelectedItem(at: index, obj: obj)
    }
}

public extension UIViewController {
    func add(child:UIViewController,subview:UIView) {
        addChild(child)
        child.view.frame = subview.bounds
        subview.addSubview(child.view)
        child.didMove(toParent: self)
    }
}
