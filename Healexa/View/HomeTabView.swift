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
            
            // Custom Tab Bar
            HStack {
                Spacer()
                CustomTabBarButton(image: "house.fill", title: "Home", isSelected: selectedTab == 0) {
                    selectedTab = 0
                }
                Spacer()
                CustomTabBarButton(image: "calendar", title: "Appointment", isSelected: selectedTab == 1) {
                    selectedTab = 1
                }
                Spacer()
                CustomTabBarButton(image: "message", title: "Message", isSelected: selectedTab == 2) {
                    selectedTab = 2
                }
                Spacer()
                CustomTabBarButton(image: "gearshape", title: "Settings", isSelected: selectedTab == 3) {
                    selectedTab = 3
                }
                Spacer()
            }
            .frame(height: 65)
            .background(Color.appColor6C4BA4)
            .cornerRadius(20)
            .padding(.horizontal)
        }
        .navigationBarBackButtonHidden(true)
    }
}
