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
    case allCategoryListView
    case bookAppointmentView

    var id: String {
        switch self {
        case .onboarding:
            return Constants.NavigationDestinationIdentifier.onboarding
        case .homeTab:
            return Constants.NavigationDestinationIdentifier.homeTab
        case .doctorListView:
            return Constants.NavigationDestinationIdentifier.doctorListView
        case .allCategoryListView:
            return Constants.NavigationDestinationIdentifier.allCategoryListView
        case .bookAppointmentView:
            return Constants.NavigationDestinationIdentifier.bookAppointmentView
        }
    }
}
