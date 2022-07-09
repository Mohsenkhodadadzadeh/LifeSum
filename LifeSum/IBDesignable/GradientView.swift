//
//  GradientView.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import UIKit

@IBDesignable class GradientView: UIView {
    
    @IBInspectable var topColor: UIColor = UIColor.white {
        didSet {
            (layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
        }
    }
    
    @IBInspectable var bottomColor: UIColor = UIColor.black {
        didSet {
            (layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
        }
    }
    
    @IBInspectable var StartPoing: CGPoint = CGPoint(x: 0, y: 0) {
        didSet {
            (layer as! CAGradientLayer).startPoint = StartPoing
        }
    }
    
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0, y: 1) {
        didSet {
            (layer as! CAGradientLayer).endPoint = endPoint
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }

    @IBInspectable public var shadowColorLayer: UIColor = UIColor.clear {
        didSet {
                self.layer.masksToBounds = false
            layer.shadowColor = shadowColorLayer.cgColor
        }
    }

    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }

    @IBInspectable public var shadowOffsetLayer: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            layer.shadowOffset = shadowOffsetLayer
        }
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
}
