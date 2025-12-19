// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI


@available(iOS 13.0, *)
public struct ColorTheme {

    @available(iOS 13.0, *)
    public struct Variant {

        public let background: Color
        public let groupBoxBG: Color
        public let navigationBG: Color
        public let tabBarBG: Color
        public let pickerBG: Color

        public let toolBarItems: Color
        public let navigationText: Color
        public let tint: Color
        public let stroke: Color
        public let logo: Color
        
        public init(
            background: Color,
            groupBoxBG: Color,
            navigationBG: Color,
            tabBarBG: Color,
            pickerBG: Color,
            toolBarItems: Color,
            navigationText: Color,
            tint: Color,
            stroke: Color,
            logo: Color
        ) {
            self.background = background
            self.groupBoxBG = groupBoxBG
            self.navigationBG = navigationBG
            self.tabBarBG = tabBarBG
            self.pickerBG = pickerBG
            self.toolBarItems = toolBarItems
            self.navigationText = navigationText
            self.tint = tint
            self.stroke = stroke
            self.logo = logo
        }
    }
    
    public let light: Variant
    public let dark: Variant

    public init(light: Variant, dark: Variant) {
        self.light = light
        self.dark = dark
    }
}


@available(iOS 17.0, *)
@Observable
public final class ColorManager {

    public var colorScheme: ColorScheme
    public private(set) var darkMode: Bool

    private let theme: ColorTheme

    public init(
        theme: ColorTheme,
        colorScheme: ColorScheme = .light
    ) {
        self.theme = theme
        self.colorScheme = colorScheme
        self.darkMode = (colorScheme == .dark)
    }

    public func updateColorScheme(_ newColorScheme: ColorScheme) {
        self.colorScheme = newColorScheme
        self.darkMode = (newColorScheme == .dark)
    }

    private var colors: ColorTheme.Variant {
        darkMode ? theme.dark : theme.light
    }
}


@available(iOS 17.0, *)
public extension ColorManager {

    // background colors
    var background: Color {
        colors.background
    }

    var groupBoxBG: Color {
        colors.groupBoxBG
    }
    
    var navigationBG: Color {
        colors.navigationBG
    }
    
    var tabBarBG: Color {
        colors.tabBarBG
    }
    
    var pickerBG: Color {
        colors.pickerBG
    }
    
    var toolBarItems: Color {
        colors.toolBarItems
    }

    var navigationText: Color {
        colors.navigationText
    }

    // ornaments
    var tint: Color {
        colors.tint
    }

    var stroke: Color {
        colors.stroke
    }

    var logo: Color {
        colors.logo
    }


}
