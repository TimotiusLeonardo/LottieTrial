//
//  TrueCodeViewController.swift
//  LottieTrial
//
//  Created by Timotius Leonardo Lianoto on 06/06/23.
//

import UIKit
import Lottie

class TrueCodeViewController: UIViewController {
    
    // var animation: LottieAnimationView?
    var animationContainer: UIView?
    lazy var buttonPlay: UIButton = UIButton()
    let urlInString: String = "https://assets9.lottiefiles.com/packages/lf20_1xU9Bzegk7.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
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
        animationContainer = UIView()
        self.view.addSubview(animationContainer!)
        animationContainer?.frame = self.view.frame
        let animation = LottieAnimationView(url: url!,
                                        closure: { _ in
            // Completions
        })
        
        animation.animationLoaded = { animationView, animation in
            animationView.play { [weak self] _ in
                self?.animationContainer?.removeFromSuperview()
                self?.animationContainer = nil
            }
        }
        
        // guard let animation = animation else { return }
        
         self.animationContainer?.addSubview(animation)
         view.layoutIfNeeded()
         animation.frame = self.animationContainer!.frame
        
//         animationContainer?.setupAnimation()
    }
}


