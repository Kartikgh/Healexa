//
//  HomeTabView.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 31/01/25.
//

import SwiftUI

struct HomeTabView: View {
    @State private var selectedTab = 0
    @EnvironmentObject var router: NavigationRouter
    @StateObject private var keyboardObserver = KeyboardObserver()
    
    var body: some View {
        VStack {
            // Main Content
            ZStack {
                switch selectedTab {
                case 0:
                    HomeView()
                        .environmentObject(router)
                case 1:
                    AppointmentView()
                        .environmentObject(router)
                case 2:
                    MessageView()
                        .environmentObject(router)
                case 3:
                    SettingsView()
                        .environmentObject(router)
                default:
                    HomeView()
                        .environmentObject(router)
                }
            }
            .frame(maxHeight: .infinity)
            
            // Push TabBar down when keyboard is shown
            FixedSpacer(height: keyboardObserver.keyboardHeight > 0 ? 0 : 20)
            
            // Custom Tab Bar
            HStack {
                Spacer()
                CustomTabBarButton(image: ImageAssetName.homeTabIcon, title: Constants.homeTabTitle, isSelected: selectedTab == 0) {
                    selectedTab = 0
                }
                Spacer()
                CustomTabBarButton(image: ImageAssetName.calendarTabIcon, title: Constants.AppointmentTabTitle, isSelected: selectedTab == 1) {
                    selectedTab = 1
                }
                Spacer()
                CustomTabBarButton(image: ImageAssetName.messageTabIcon, title: Constants.messageTabTitle, isSelected: selectedTab == 2) {
                    selectedTab = 2
                }
                Spacer()
                CustomTabBarButton(image: ImageAssetName.settingTabIcon, title: Constants.settingsTabTitle, isSelected: selectedTab == 3) {
                    selectedTab = 3
                }
                Spacer()
            }
            .frame(height: 65)
            .background(Color.appColor6C4BA4)
            .cornerRadius(20)
            .padding(.horizontal)
            .padding(.bottom, keyboardObserver.keyboardHeight > 0 ? -65 : 0) // Hide TabBar when keyboard is up
            .animation(.easeInOut(duration: 0.3), value: keyboardObserver.keyboardHeight)
        }
        .navigationBarBackButtonHidden(true)
    }
}


import SwiftUI
import Combine

class KeyboardObserver: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    private var cancellables: Set<AnyCancellable> = []

    init() {
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .merge(with: NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification))
            .sink { notification in
                if let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                    DispatchQueue.main.async {
                        self.keyboardHeight = frame.minY < UIScreen.main.bounds.height ? frame.height : 0
                    }
                }
            }
            .store(in: &cancellables)
    }
}
