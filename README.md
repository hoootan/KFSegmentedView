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
