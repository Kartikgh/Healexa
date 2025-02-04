//
//  SectionWithScrollableCardsView.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 03/02/25.
//

import Foundation
import SwiftUI

struct SectionWithScrollableCardsView<Content: View>: View {
    var title: String?
    var isVertical: Bool = false
    var showViewAll: Bool = true
    var viewAllAction: (() -> Void)?
    var content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let title = title, !title.isEmpty {
                HStack {
                    Text(title)
                        .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size22.value, color: Color.appColorHeaderTitle)
                    FixedSpacer()
                    if showViewAll {
                        Button(action: {
                            viewAllAction?()
                        }) {
                            Text(Constants.viewAll)
                                .fontAndColor(name: AppFont.regular.name, size: AppFontSize.size12.value, color: Color.appColorNameTitle)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                        }
                        .background(Color.appColorViewAllBg)
                        .cornerRadius(8)
                    }
                }
                .padding()
            }
            
            if isVertical {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 15) {
                        content()
                    }
                    .padding(.horizontal)
                }
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        content()
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}
