//
//  FullscreenLoader.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import UIKit
import Lottie

class FullscreenLoader: NSObject {
    static var currentOverlay: UIView?
    static var currentOverlayTarget: UIView?
    static var animationView: AnimationView?
    
    static func show() {
        guard let currentMainWindow = UIApplication.shared.keyWindow else {
            fatalError("Main window wasn't found!!")
        }
        show(currentMainWindow)
    }
    
    static func show(_ overlayTarget: UIView) {
        hide()
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        let overlay = UIImageView.init(frame: overlayTarget.frame)
        overlay.center = overlayTarget.center
        overlay.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        overlayTarget.addSubview(overlay)
        overlayTarget.bringSubviewToFront(overlay)
       
        if animationView == nil {
            let animationView = AnimationView()
            let path = Bundle.main.path(forResource: "green-eco-earth-animation",
                                        ofType: "json") ?? ""
            let animation = Animation.filepath(path)
            animationView.animation = animation
            animationView.frame = CGRect(x: 0, y: 0, width: 220, height: 220)
            animationView.center = overlay.center
            animationView.loopMode = .loop
            animationView.animationSpeed = 0.6
            self.animationView = animationView
        }
        
        if let animationView = animationView {
            animationView.play()
            overlay.addSubview(animationView)
        }

        currentOverlay = overlay
        currentOverlayTarget = overlayTarget
    }
    
    static func hide() {
        if UIApplication.shared.isIgnoringInteractionEvents {
            UIApplication.shared.endIgnoringInteractionEvents()
        }
        if currentOverlay != nil {
            currentOverlay?.removeFromSuperview()
            animationView?.stop()
            currentOverlay =  nil
            currentOverlayTarget = nil
        }
    }
}
