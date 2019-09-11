# KFSegmentedView

## Requirements

* iOS 10.0+

## Installation

#### From [CocoaPods](http://www.cocoapods.org)

`pod 'KFSegmentedView'`

#### From source

* Drag the `KFSegmentedView` folder to your project

## Getting Started

1. import `KFSegmentedView` in your workspace

````swift
import KFSegmentedView
````

2. create an instance of `KFSegmentedViewController` in your workspace

````swift
let segmentedController = KFSegmentedController(delegate: self, items: objs)
````

3. you need to add and conform to `KFSegmentedControllerDelegate` in main controller 

```swift
extension ViewController : KFSegmentedControllerDelegate {
    func segmentedSelectedItem(at index: Int, obj: KFSegmentObject) {
        
    }
}
````

4. you need to create array of `KFSegmentedObject`

````swift
let objs = [
            KFSegmentObject(model:TestClass(), index: 0, title: "first", settings: setting),
            KFSegmentObject(index: 1, title: "second", settings: setting),
            KFSegmentObject(index: 2, title: "third", settings: setting),
            KFSegmentObject(index: 3, title: "fourth", settings: setting)
        ]
````

## Customization

#### KFSetting

- to customize segmented view you have to set some properties

````swift
let setting = KFSetting(font: UIFont.systemFont(ofSize: 14), //optional
                        selectedTextColor: .black,
                        unselectedTextColor: .white,
                        selectedBackgroundColor: .white,
                        unselectedBackgroundColor: .clear,
                        selectedBorderColor: .black,
                        unselectedBorderColor: .clear,
                        borderWidth: 1,   //optional
                        cornerRadius: 15) //optional
````                               

* note that you have to pass this setting to `KFSegmentObject`

