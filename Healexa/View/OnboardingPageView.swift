//
//  OnboardingPageView.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 31/01/25.
//

import Foundation
import SwiftUI

struct OnboardingPageView: View {
    let page: OnboardingPage
    
    var body: some View {
        VStack(spacing: 20) {
            Image(page.image)
                .resizable()
                .scaledToFit()
            
            Text(page.title)
                .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size22.value, color: Color(.appColor6C4BA4))
            
            Text(page.description)
                .fontAndColor(name: AppFont.regular.name, size: AppFontSize.size14.value, color: Color(.gray))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
        }
    }
}
