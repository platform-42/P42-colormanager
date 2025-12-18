// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI


@available(iOS 13.0, *)
public struct ColorTheme {

    @available(iOS 13.0, *)
    public struct Variant {

        public let background: Color
        public let groupBoxBackground: Color

        public let tabBarBackground: Color
        public let tabBarItems: Color

        public let navigationBackground: Color
        public let navigationText: Color

        public let tint: Color
        public let stroke: Color
        public let logo: Color
        public let pickerBackground: Color
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

    var background: Color {
        colors.background
    }

    var groupBoxBG: Color {
        colors.groupBoxBackground
    }

    var tabBarBG: Color {
        colors.tabBarBackground
    }

    var tabBarItems: Color {
        colors.tabBarItems
    }

    var navigationBG: Color {
        colors.navigationBackground
    }

    var navigationText: Color {
        colors.navigationText
    }

    var tint: Color {
        colors.tint
    }

    var stroke: Color {
        colors.stroke
    }

    var logo: Color {
        colors.logo
    }

    var pickerBG: Color {
        colors.pickerBackground
    }
}
