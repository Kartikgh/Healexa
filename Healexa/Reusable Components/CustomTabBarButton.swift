//
//  CustomTabBarButton.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 03/02/25.
//

import SwiftUI

struct CustomTabBarButton: View {
    let image: String
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        VStack {
            Button(action: action) {
                VStack(spacing: 5) {
                    Image(systemName: image)
                        .fontAndColor(name: AppFont.regular.name, size: AppFontSize.size20.value, color: isSelected ? Color.white : Color.white.opacity(0.5))
                    Text(title)
                        .fontAndColor(name: AppFont.regular.name, size: AppFontSize.size12.value, color: isSelected ? Color.white : Color.white.opacity(0.5))
                }
            }
            .padding(.top, 5)
        }
        .frame(maxWidth: .infinity)
    }
}
