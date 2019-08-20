# traitCollectionDidChange(_:)
在 iOS 系统环境设置发生改变时调用。
```swift
func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?)
```
参数传的是改变前的 UITraintCollection.
默认实现为空
场景：比如从横屏变成竖屏，可以在这里做操作。在设置中改变字体。
一开始应该调用super方法确保父类实现的优先级。
```swift
override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if(self.traitCollection.verticalSizeClass != previousTraitCollection?.verticalSizeClass){
            print("verticalSizeClass Changed")
        }
    }
```

