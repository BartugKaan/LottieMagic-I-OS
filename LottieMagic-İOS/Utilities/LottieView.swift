//
//  LottieView.swift
//  LottieMagic-İOS
//
//  Created by Bartuğ Kaan Çelebi on 28.01.2025.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable{
    var name: String
    var loopMode: LottieLoopMode = .loop
    var animationSpeed: CGFloat = 1.0
    
    func makeUIView(context: Context) -> LottieAnimationView {
        let animationView = LottieAnimationView(name: name)
        animationView.loopMode = loopMode
        animationView.animationSpeed = animationSpeed
        animationView.contentMode = .scaleAspectFit
        animationView.backgroundBehavior = .pauseAndRestore
        
        animationView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        animationView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        
        animationView.play()
        return animationView
    }
    
    func updateUIView(_ uiView: LottieAnimationView, context: Context) {
        uiView.play()
    }
    
    
}
