## SwiftUIInfinityScroll

InfinityScroll view for SwiftUI

## Features

:warning: WARNING :warning:

Because of lack of Swift UI ScrollView functions,

Many features aren’t implemented yet :bow:

(more detail [here](todo add link))

- [x] Vertical & horizontal infinity scroll
- [ ] Minus page direction scroll
- [ ] Scroll per page by flick
- [ ] Discard invisible page for performance.

When ScrollView get more functions, I’m planning to these features :muscle:

## Requirements

- iOS 13.0+
- Xcode 11.0+
- Swift 5.1+

## Installation

You can install `SwiftUIInfinityScroll` via CocoaPods by adding the following line to your `Podfile`:

```ruby
pod 'SwiftUIInfinityScroll', '~> 0.0.1'
```

Run the `pod install` command to download the library
and integrate it into your Xcode project.

## Usage
1. Define your Item View to show on infinity scroll view. 
This class must conform InifinityScrollViewItemable protocol.

```swift
struct DoraemonViewItem: InfinityScrollViewItemable {
    public var id = UUID()
    public var page: Int
    var body: some View {
        return HStack{
            Image(“doraemon”)
            Text(“\(page)”)
        }
    }
}
```

2. Define Item generator. Generator class must conform ItemGeneratable protocol to generate a item.

```swift
class DoraemonGenerator: ItemGeneratable {
    typealias Item = DoraemonViewItem
    func generateItem(page: Int) -> DoraemonViewItem {
        return DoraemonViewItem(page: page)
    }
}
```

3. Use it in you view.
```swift
struct DoraemonScrollView_Previews: PreviewProvider {
    static var previews: some View {
        DoraemonScrollView()
    }
}
```

You can instantly check it on [Sample Project]()

## Versioning
For the versions available, see the [tags on this repository](https://github.com/kazuooooo/SwiftUIInfinityScroll/tags). 

## Contributing
Any contributions are Welcome :+1:	Don't hesitate!
Fork repo and create PR, please.

## Credits
SwiftUIInfinityScroll was ispired by the following projects:
[**WaterfallGrid**](https://github.com/paololeonardi/WaterfallGrid/blob/master/README.md)
Especially how to compose directory structure and write this README.md :smile_cat:

## License
SwiftUIInfinityScroll is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

