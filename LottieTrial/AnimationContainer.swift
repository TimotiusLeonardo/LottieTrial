//
//  AnimationContainer.swift
//  LottieTrial
//
//  Created by Timotius Leonardo Lianoto on 06/06/23.
//

import UIKit
import Lottie

class AnimationContainerView: UIView {
    var animation: LottieAnimationView?
    
    func setupAnimation() {
        guard let animation = animation else { return }
        addSubview(animation)
        layoutIfNeeded()
        animation.frame = self.frame
    }
    
    func removeAnimation() {
        animation?.stop()
        animation?.layer.removeAllAnimations()
        animation?.animationLoaded = nil
        animation?.animation = nil
    }
}
