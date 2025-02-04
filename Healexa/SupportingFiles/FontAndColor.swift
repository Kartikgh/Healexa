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
        case .regular: return Constants.FontFamilyTitle.SFProText_Regular
        case .bold: return Constants.FontFamilyTitle.SFProText_Bold
        case .medium: return Constants.FontFamilyTitle.SFProText_Medium
        case .semibold: return Constants.FontFamilyTitle.SFProText_SemiBold
        case .light: return Constants.FontFamilyTitle.SFProText_light
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
        case .size8: return CGFloat(Constants.FontSizeNumber.size8)
        case .size10: return CGFloat(Constants.FontSizeNumber.size10)
        case .size12: return CGFloat(Constants.FontSizeNumber.size12)
        case .size14: return CGFloat(Constants.FontSizeNumber.size14)
        case .size16: return CGFloat(Constants.FontSizeNumber.size16)
        case .size18: return CGFloat(Constants.FontSizeNumber.size18)
        case .size20: return CGFloat(Constants.FontSizeNumber.size20)
        case .size22: return CGFloat(Constants.FontSizeNumber.size22)
        }
    }
}
