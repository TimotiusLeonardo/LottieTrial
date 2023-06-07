//
//  ViewController.swift
//  LottieTrial
//
//  Created by Timotius Leonardo Lianoto on 06/06/23.
//

import UIKit
import Lottie

class FalseCodeViewController: UIViewController {
    
    var animation: LottieAnimationView?
    lazy var buttonPlay: UIButton = UIButton()
    let urlInString: String = "https://assets9.lottiefiles.com/packages/lf20_1xU9Bzegk7.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(buttonPlay)
        buttonPlay.translatesAutoresizingMaskIntoConstraints = false
        buttonPlay.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        buttonPlay.heightAnchor.constraint(equalToConstant: 100).isActive = true
        buttonPlay.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        buttonPlay.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        buttonPlay.setTitle("Play Animation", for: .normal)
        buttonPlay.setTitleColor(.blue, for: .normal)
        buttonPlay.titleLabel?.textAlignment = .center
        
        
        buttonPlay.addTarget(self, action: #selector(onButtonPlayTapped), for: .touchUpInside)
    }
    
    @objc func onButtonPlayTapped() {
        playRandomAnimation()
    }
    
    func playRandomAnimation() {
        let url = URL(string: urlInString)
        let animation = LottieAnimationView(url: url!,
                                        closure: { _ in
            // Completions
        })
        
        animation.animationLoaded = { animationView, animation in
            animationView.play { [weak self] _ in
                // Remove animation view from superview
                animationView.removeFromSuperview()
                self?.animation = nil
            }
        }
        
//        guard let animation = animation else { return }
        
        self.view.addSubview(animation)
        view.layoutIfNeeded()
        animation.frame = self.view.frame
    }
}

