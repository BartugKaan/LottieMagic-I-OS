//
//  OnboardingViewModel.swift
//  LottieMagic-İOS
//
//  Created by Bartuğ Kaan Çelebi on 28.01.2025.
//

import SwiftUI

final class OnboardingViewModel: ObservableObject {
    //MARK - Properties
    @Published var currentPage: Int = 0
    @Published var onboardingItems: [OnboardingItem] = [
        OnboardingItem(
            title: "Welcome to LottieMagic",
            description: "Discover the power of beautiful animations in your iOS applications",
            lottieFile: "welcome"
        ),
        OnboardingItem(
            title: "Endless Possibilities",
            description: "Create stunning user experiences with customizable animations",
            lottieFile: "customize"
        ),
        OnboardingItem(
            title: "Ready to Begin!",
            description: "Start building amazing animations for your apps today",
            lottieFile: "get-started"
        )
    ]
    
    // MARK - Functions
    func goToNextPage() {
        withAnimation {
            guard currentPage < onboardingItems.count - 1 else { return }
            currentPage += 1
        }
    }
    
    func skipOnboarding() {
        withAnimation {
            currentPage = onboardingItems.count - 1
        }
    }
}
