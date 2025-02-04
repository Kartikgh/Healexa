//
//  OnboardingViewModel.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 31/01/25.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var pages: [OnboardingPage] = [
        OnboardingPage(image: ImageAssetName.introImage, title: Constants.welcomeNoteTitle1, description: Constants.welcomeNoteSubTitle1),
        OnboardingPage(image: ImageAssetName.introImage, title: Constants.welcomeNoteTitle2, description: Constants.welcomeNoteSubTitle2),
        OnboardingPage(image: ImageAssetName.introImage, title: Constants.welcomeNoteTitle3, description: Constants.welcomeNoteSubTitle3)
    ]
}
