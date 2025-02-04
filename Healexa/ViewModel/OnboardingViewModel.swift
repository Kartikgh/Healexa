//
//  OnboardingViewModel.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 31/01/25.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var pages: [OnboardingPage] = [
        OnboardingPage(image: ImageAssetName.introImage, title: "Welcome to Healexa", description: "Your trusted healthcare companion."),
        OnboardingPage(image: ImageAssetName.introImage, title: "Find Doctors Easily", description: "Book appointments with top specialists."),
        OnboardingPage(image: ImageAssetName.introImage, title: "Get Medical Advice", description: "Receive personalized health recommendations.")
    ]
}
