//
//  OnboardingViewModel.swift
//  LottieMagic-İOS
//
//  Created by Bartuğ Kaan Çelebi on 28.01.2025.
//

import Foundation

final class OnboardingViewModel: ObservableObject {
    //MARK - Properties
    @Published var currentPage: Int = 0
    @Published var onboardingItems: [OnboardingItem] = [
        OnboardingItem(title: "Welcome", description: "Start exploring our application.", lottieFile: "welcome"),
        OnboardingItem(title: "Customize", description: "Adjust according to your needs.", lottieFile: "customize"),
        OnboardingItem(title: "Lets Start!", description: "Experience it now.", lottieFile: "get-started")
    ]
    
    // MARK - Functions
    func goToNextPage() {
        guard currentPage < onboardingItems.count - 1 else { return }
        currentPage += 1
    }
    
    func skipOnboarding() {
        currentPage = onboardingItems.count - 1
    }
}
