//
//  OnboardingPageView.swift
//  LottieMagic-İOS
//
//  Created by Bartuğ Kaan Çelebi on 28.01.2025.
//

import SwiftUI

struct OnboardingPageView: View {
    let item: OnboardingItem
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 40)
            
            // Lottie Animation
            LottieView(name: item.lottieFile)
                .frame(width: 400, height: 400)
            
            Spacer()
            
            VStack(spacing: 16) {
                // Title
                Text(item.title)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                    .multilineTextAlignment(.center)
                
                // Description
                Text(item.description)
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 24)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
                .frame(height: 100)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(colorScheme == .dark ? Color.black : Color.white)
    }
}
