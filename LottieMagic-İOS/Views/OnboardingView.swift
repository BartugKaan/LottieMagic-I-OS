//
//  OnboardingView.swift
//  LottieMagic-İOS
//
//  Created by Bartuğ Kaan Çelebi on 28.01.2025.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: colorScheme == .dark ?
                    [Color.black, Color.gray.opacity(0.2)] :
                    [Color.white, Color.blue.opacity(0.05)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // Content
            VStack(spacing: 0) {
                // Pages
                TabView(selection: $viewModel.currentPage) {
                    ForEach(Array(viewModel.onboardingItems.enumerated()), id: \.element.id) { index, item in
                        OnboardingPageView(item: item)
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                
                // Controls
                controlButtons
                    .padding(.horizontal, 24)
                    .padding(.vertical, 20)
                    .background(
                        Rectangle()
                            .fill(colorScheme == .dark ? Color.black : Color.white)
                            .edgesIgnoringSafeArea(.bottom)
                    )
            }
        }
        .animation(.easeInOut, value: viewModel.currentPage)
    }
    
    private var controlButtons: some View {
        VStack(spacing: 12) {
            if viewModel.currentPage < viewModel.onboardingItems.count - 1 {
                HStack {
                    Button(action: viewModel.skipOnboarding) {
                        Text("Skip")
                            .font(.system(.body, design: .rounded))
                            .foregroundStyle(.secondary)
                            .padding(.vertical, 8)
                    }
                    
                    Spacer()
                    
                    Button(action: viewModel.goToNextPage) {
                        Text("Next")
                            .font(.system(.body, design: .rounded).bold())
                            .foregroundColor(.white)
                            .padding(.horizontal, 28)
                            .padding(.vertical, 14)
                            .background(Color.blue)
                            .clipShape(Capsule())
                            .shadow(color: .blue.opacity(0.3), radius: 8, x: 0, y: 4)
                    }
                }
            } else {
                Button(action: { print("Onboarding completed!") }) {
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded).bold())
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .shadow(color: .blue.opacity(0.3), radius: 8, x: 0, y: 4)
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
