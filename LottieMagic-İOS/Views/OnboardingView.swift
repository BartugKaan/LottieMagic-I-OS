//
//  OnboardingView.swift
//  LottieMagic-İOS
//
//  Created by Bartuğ Kaan Çelebi on 28.01.2025.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    var body: some View {
        ZStack{
            //Pages
            TabView(selection: $viewModel.currentPage) {
                ForEach(Array(viewModel.onboardingItems.enumerated()), id: \.element.id)
                {index, item in
                    OnboardingPageView(item: item)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            //Buttons
            VStack(){
                Spacer()
                onboardingControls
                    .padding()
            }
        }
    }
    
    //MARK - Buttons
    private var onboardingControls: some View {
        Group{
            if viewModel.currentPage < viewModel.onboardingItems.count - 1{
                HStack{
                    Button("Skip", action: viewModel.skipOnboarding)
                        .foregroundStyle(.gray)
                    Button("Next", action: viewModel.goToNextPage)
                        .buttonStyle(.borderedProminent)
                }
            }
            else{
                Button("Start") {
                    print("Onboarding completed!")
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    OnboardingView()
}
