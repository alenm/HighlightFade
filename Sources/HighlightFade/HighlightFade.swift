// HighlightFade.swift

import SwiftUI


public struct HighlightFade: ViewModifier {

    public typealias Seconds = Double

    public var isActive: Bool
    /// The default color for this is yellow
    public var color: Color
    /// The fading out animation is by default 4 seconds long
    public var duration: Seconds
    /// The colors opacity is started at this value
    public var startOpacity: Double
    /// The color opacity will end at this value
    public var endOpacity: Double
    
    @State private var fadeOut: Bool = false
    
    public init(color: Color = .yellow,
                duration: Seconds = 4,
                startOpacity: Double = 0.4,
                endOpacity: Double = 0.0,
                isActive: Bool) {
        self.isActive = isActive
        self.color = color
        self.duration = duration
        self.startOpacity = startOpacity
        self.endOpacity = endOpacity
    }
    
    public func body(content: Content) -> some View {
        Group {
            if isActive == true {
                content
                    .background(fadeOut == true ? color.opacity(endOpacity) : color.opacity(startOpacity))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            self.fadeOut.toggle()
                        }
                    }.animation(.easeInOut(duration: duration), value: fadeOut)
            } else {
                content
                    .background(Color.clear)
            }
        }
    }
    
}


extension View {
    /// This view gets a background fill highlight and then fades
    /// - Parameters:
    ///   - color:  Default is .yellow, but you can provide any color that you want
    ///   - durarion: Default is 4 seconds
    ///   - startOpacity: Default is 0.4
    ///   - endOpacity: Default is 0.0
    ///   - isActive: is a boolean
    /// - Returns: A view that will change the background view from an applied color to
    public func highlightFade(color: Color = .yellow, duration: HighlightFade.Seconds = 4, startOpacity: Double = 0.4, endOpacity: Double = 0.0, isActive: Bool) -> some View {
        modifier(
            HighlightFade(
                color: color,
                duration: duration,
                startOpacity: startOpacity,
                endOpacity: endOpacity,
                isActive: isActive
            )
        )
    }
    
    /// This view gets a background fill highlight and then fades
    /// - Parameters:
    ///   - color:  Default is .yellow, but you can provide any color that you want
    ///   - durarion: Default is 4 seconds
    ///   - startOpacity: Default is 0.4
    ///   - endOpacity: Default is 0.0
    ///   - isActive: Is a closure that you can define. Anything that returns to true will return
    /// - Returns: A view that will change the background view from an applied color to
    public func highlightFade(color: Color = .yellow, duration: HighlightFade.Seconds = 4, startOpacity: Double = 0.4, endOpacity: Double = 0.0, isActive: () -> Bool) -> some View {
        modifier(
            HighlightFade(
                color: color,
                duration: duration,
                startOpacity: startOpacity,
                endOpacity: endOpacity,
                isActive: isActive()
            )
        )
    }
}


@available(iOS 14.0, *)
struct ModiferLibrary: LibraryContentProvider {
    @LibraryContentBuilder
    func modifiers(base: Any) -> [LibraryItem] {
        LibraryItem(HighlightFade(isActive: true))
    }
}
