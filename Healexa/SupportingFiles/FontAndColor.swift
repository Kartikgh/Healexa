//
//  FontAndColor.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 31/01/25.
//
import SwiftUI

struct FontAndColor: ViewModifier {
    var fontName: String
    var fontSize: CGFloat
    var color: Color
    func body(content: Content) -> some View {
        content
            .font(Font.custom(fontName, fixedSize: fontSize))
            .foregroundColor(color)
    }
}

extension View {
    func fontAndColor(name: String, size: CGFloat, color: Color) -> some View {
        modifier(FontAndColor(fontName: name, fontSize: size, color: color))
    }
}

enum AppFont: String {
    case regular
    case bold
    case medium
    case semibold
    case light
    
    var name: String {
        switch self {
        case .regular: return "SFProText-Regular"
        case .bold: return "SFProText-Bold"
        case .medium: return "SFProText-Medium"
        case .semibold: return "SFProText-Semibold"
        case .light: return "SFProText-Light"
        }
    }
}

enum AppFontSize: CGFloat {
    case size8
    case size10
    case size12
    case size14
    case size16
    case size18
    case size20
    case size22
    
    var value: CGFloat {
        switch self {
        case .size8: return 8
        case .size10: return 10
        case .size12: return 12
        case .size14: return 14
        case .size16: return 16
        case .size18: return 18
        case .size20: return 20
        case .size22: return 22
        }
    }
}
