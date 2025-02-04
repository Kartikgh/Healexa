//
//  NavigationDestination.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 03/02/25.
//

import Foundation
import SwiftUI

// Define an enum that conforms to Identifiable and Hashable
enum NavigationDestination: Hashable, Identifiable {
    case onboarding
    case homeTab
    case doctorListView

    var id: String {
        switch self {
        case .onboarding:
            return "onboarding"
        case .homeTab:
            return "homeTab"
        case .doctorListView:
            return "doctorListView"
        }
    }
}
