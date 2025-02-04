//
//  SplashScreen.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 30/01/25.
//

import SwiftUI

struct OnBoardingView: View {
    
    @StateObject private var viewModel = OnboardingViewModel()
    @State private var currentPage = 0
    @State private var timer: Timer?
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        VStack {
            OnboardingPagerView(
                pages: viewModel.pages,
                currentPage: $currentPage,
                startTimer: startTimer,
                stopTimer: stopTimer
            )

            OnboardingPageIndicator(
                totalPages: viewModel.pages.count,
                currentPage: currentPage
            )
            
            OnboardingNextButton(
                currentPage: $currentPage,
                totalPages: viewModel.pages.count,
                navigationPath: $router.navigationPath
            )
        }
        .padding(.bottom, 40)
        .onAppear { startTimer() }
    }
    
    private func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            withAnimation {
                if currentPage < viewModel.pages.count - 1 {
                    currentPage += 1
                } else {
                    stopTimer()
                }
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}


// MARK: - Onboarding Pager View (TabView)
struct OnboardingPagerView: View {
    let pages: [OnboardingPage]
    @Binding var currentPage: Int
    let startTimer: () -> Void
    let stopTimer: () -> Void

    var body: some View {
        TabView(selection: $currentPage) {
            ForEach(pages.indices, id: \.self) { index in
                OnboardingPageView(page: pages[index])
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .onChange(of: currentPage) { newPage in
            if newPage == pages.count - 1 {
                stopTimer()
            } else {
                startTimer()
            }
        }
    }
}

// MARK: - Onboarding Page Indicator (Dots)
protocol PageIndicator {
    var totalPages: Int { get }
    var currentPage: Int { get }
}

struct OnboardingPageIndicator: View, PageIndicator {
    let totalPages: Int
    let currentPage: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<totalPages, id: \.self) { index in
                Circle()
                    .fill(currentPage == index ? Color.appColor6C4BA4 : Color.gray.opacity(0.5))
                    .frame(width: 8, height: 8)
            }
        }
        .padding(.top, 8)
    }
}

// MARK: - Onboarding Next Button
struct OnboardingNextButton: View {
    @Binding var currentPage: Int
    let totalPages: Int
    @Binding var navigationPath: NavigationPath

    var body: some View {
        Button(action: {
            if currentPage < totalPages - 1 {
                withAnimation {
                    currentPage += 1
                }
            } else {
                navigationPath.append(NavigationDestination.homeTab)
                UserDefaults.isOnboardingCompleted = true
            }
        }) {
            Text(currentPage == totalPages - 1 ? Constants.getStartedTitle : Constants.nextTitle)
                .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size16.value, color: Color(.white))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.appColor6C4BA4)
                .cornerRadius(10)
                .padding(.horizontal, 40)
        }
        .padding(.top, 20)
    }
}
