//
//  OnboardingItem.swift
//  LottieMagic-İOS
//
//  Created by Bartuğ Kaan Çelebi on 28.01.2025.
//

import Foundation

struct OnboardingItem: Identifiable{
    let id = UUID()
    let title: String
    let description: String
    let lottieFile: String // "welcome.json" file will be written as "welcome"
}
