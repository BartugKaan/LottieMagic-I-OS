//
//  OnboardingPageView.swift
//  LottieMagic-İOS
//
//  Created by Bartuğ Kaan Çelebi on 28.01.2025.
//

import SwiftUI

struct OnboardingPageView: View {
    let item: OnboardingItem
    
    var body: some View {
        VStack(spacing:20) {
            //Lottie Animation
            LottieView(name: item.lottieFile)
                .frame(height: 300)
            //Title
            Text(item.title)
                .font(.title.bold())
                .foregroundStyle(.primary)
            //Description
            Text(item.description)
                .font(.title.bold())
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .padding(.horizontal, 32)
        }
        .padding()
    }
}
