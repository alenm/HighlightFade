# HighlightFade
In the early 2000's, with a little bit of CSS and JQuery we had a technique known as the **yellow fade technique (YFT)**. This UI technique was a nice way of spotlighting what has changed on a webpage when editing or updating a page. It was popularized by [37 signals](https://web.archive.org/web/20140302110432/https://signalvnoise.com/archives/000558.php).  

I made a swift package that allows you to do something similar but it's called **HighlightFade**, part of **SwiftUI** and requires no javascript or npm packages. The implementation details are straight forward.

https://user-images.githubusercontent.com/568130/186227524-3b3f6652-a333-47ab-a26d-4915ccd37906.mp4


## Installation

The [Swift Package Manager](https://swift.org/package-manager/) is the preferred tool

From Xcode 12+ :

1. Select File > Swift Packages > Add Package Dependency. 
2. Enter `https://github.com/alenm/HighlightFade` in the "Choose Package Repository" dialog.
2. In the next page, specify the version resolving rule as "Up to Next Major" from "1.0.0".
3. After Xcode checked out the source and resolving the version, you can choose the "HighlightFade" library and add it to your app target.

For more info, read [Adding Package Dependencies to Your App](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) from Apple.


## Usage
Use it as a view modifier as shown below. The only parameter to be concerned with is `isActive:Bool`. See the example below.

```swift
import HighlightFade

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("Hello, world!")
        }
        .modifier(HighlightFade(isActive: true))
    }
}
```

### Extension on View
The view modifer has also been made as an extension on the view. This means you can use `.highlightFade(isActive:)` as shown below.

```swift
import HighlightFade

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("Hello, world!")
        }
        .highlightFade(isActive: true)
    }
}

// or 

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("Hello, world!")
        }
        .highlightFade {
            return true
        }
    }
}
```

### Customizing
The modifier does offer some customization such as changing the color, opacity of the color and the animation duration of the opacity.

```swift
    /// The default color for this is .yellow
    public var color: Color
    /// The fading out animation is by default 4 seconds long
    public var duration: Seconds
    /// The colors opacity is started at  0.4
    public var startOpacity: Double
    /// The color opacity will end at 0.0
    public var endOpacity: Double
```

An example of using the customization could look like this.

```swift
import HighlightFade

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("Hello, world!")
        }
        .modifier(HighlightFade(color: .blue, duration: 3, startOpacity: 1.0, endOpacity: 0.2, isActive: true))
    }
}


// OR using the extension view

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("Hello, world!")
        }
        .highlightFade(color: .blue, duration: 3, startOpacity: 1.0, endOpacity: 0.2, isActive: true)
    }
}


```




##  License

HighlightFade is released under the MIT license. See [LICENSE](https://github.com/alenm/HighlightFade/blob/main/LICENSE.txt) for details.
