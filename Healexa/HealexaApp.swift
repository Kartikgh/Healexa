//
//  HealexaApp.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 30/01/25.
//

import SwiftUI

@main
struct HealexaApp: App {
    
    @State private var router = NavigationRouter()
    var body: some Scene {
        WindowGroup {
            NavigationStackView {
                if UserDefaults.isOnboardingCompleted {
                    HomeTabView()
                } else {
                    OnBoardingView()
                }
            }
            .environmentObject(router)
        }
    }
}
