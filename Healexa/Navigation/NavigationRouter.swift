//
//  NavigationRouter.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 03/02/25.
//

import Foundation
import SwiftUI

class NavigationRouter: ObservableObject {
    @Published var navigationPath = NavigationPath()
    @Published var modalPresented = false

    // Push a new view
    func push(_ destination: NavigationDestination) {
        navigationPath.append(destination)
    }

    // Pop the last view
    func pop() {
        if navigationPath.count > 0 {
            navigationPath.removeLast()
        }
    }

    // Pop to the root view
    func popToRoot() {
        navigationPath = NavigationPath()
    }
    
    // Pop the last view, but retain the second-to-last view
    func popLast() {
        if navigationPath.count > 1 {
            navigationPath.removeLast()
        }
    }
    
    // Pop the last two views
    func popLast2() {
        if navigationPath.count > 2 {
            navigationPath.removeLast(2)
        }
    }

    // Present a modal view
    func present() {
        modalPresented = true
    }

    // Dismiss modal
    func dismiss() {
        modalPresented = false
    }
}

struct NavigationStackView<Content: View>: View {
    @StateObject private var router = NavigationRouter()
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            content
                .environmentObject(router)
                .navigationDestination(for: NavigationDestination.self) { destination in
                    switch destination {
                    case .onboarding:
                        OnBoardingView().environmentObject(router)
                    case .homeTab:
                        HomeTabView().environmentObject(router)
                    case .doctorListView:
                        DoctorListView().environmentObject(router)
                    case .allCategoryListView:
                        CategoryListView().environmentObject(router)
                    case .bookAppointmentView:
                        BookAppointmentView().environmentObject(router)
                    }
                }
        }
    }
}
