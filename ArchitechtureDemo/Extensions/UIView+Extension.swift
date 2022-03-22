//
//  UIView.swift
//  Dewing Grain
//
//  Created by abc on 20/05/20.
//  Copyright © 2020 amarsingh. All rights reserved.
//

import UIKit
import Foundation

enum LineStyle {
    case horizontal
    case vertical
}

extension UIView {
   
    
    func dropShadow(color:UIColor) {
        self.layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.masksToBounds = false
        layer.shadowOpacity = 0.18
        layer.shadowRadius = 2
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
    }
    
    func cornerRadius(borderColor: UIColor = UIColor.white, borderWidth: CGFloat = 0,cornerRadius: CGFloat = 10) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.masksToBounds = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        DispatchQueue.main.async {[self] in
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }
    
    func fadeIn(duration: TimeInterval = 0.1, delay: TimeInterval = 0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        self.alpha = 0.0
        
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.isHidden = false
            self.alpha = 1.0
        }, completion: completion)
    }
    
    func fadeOut(duration: TimeInterval = 0.1, delay: TimeInterval = 0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        self.alpha = 1.0
        
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.isHidden = true
            self.alpha = 0.0
        }, completion: completion)
    }
    
    func addDashLine(width: CGFloat = 1, color: UIColor, style:LineStyle = .vertical) {
        let caShapeLayer = CAShapeLayer()
        caShapeLayer.strokeColor = color.cgColor
        caShapeLayer.lineWidth = width
        caShapeLayer.lineDashPattern = [4,3]
        let cgPath = CGMutablePath()
        var cgPoint = [CGPoint]()
        
        switch style {
            case .horizontal:
              cgPoint = [CGPoint(x: 0, y: 0), CGPoint(x: self.frame.width, y: 0)]
            case .vertical:
              cgPoint = [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: self.frame.height)]
        }
        
        cgPath.addLines(between: cgPoint)
        caShapeLayer.path = cgPath
        layer.addSublayer(caShapeLayer)
    }
    
    func addConstraints(addToView:UIView)  {
        self.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11, *) {
            let guide = addToView.safeAreaLayoutGuide
            self.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
            self.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        } else {
            self.leadingAnchor.constraint(equalTo: addToView.leadingAnchor).isActive = true
            self.trailingAnchor.constraint(equalTo: addToView.trailingAnchor).isActive = true
        }
        
        self.topAnchor.constraint(equalTo: addToView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: addToView.bottomAnchor).isActive = true
    }
    func addConstraintsWithOutSafeArea(addToView:UIView)  {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.leadingAnchor.constraint(equalTo: addToView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: addToView.trailingAnchor).isActive = true
        
        self.topAnchor.constraint(equalTo: addToView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: addToView.bottomAnchor).isActive = true
    }
    
    
}

extension UIViewController{
    func addTopBottomViewInSafeArea(color : UIColor){
        if let safeAreaInset = getSafeAreaInset(){
            let rect = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: safeAreaInset.top)
            let topView = UIView.init(frame: rect)
            topView.backgroundColor = color
            self.view.addSubview(topView)
            self.view.sendSubviewToBack(topView)
            
        }
    }
    
     func getSafeAreaInset() -> UIEdgeInsets?{
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            let safeAreaInsets = window?.safeAreaInsets
            return safeAreaInsets
        }else{
            return nil
        }
    }
    
    //Dismisses On Screen textfiled when user touches on parent view
    func addGestureToResignKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))

        tap.cancelsTouchesInView = true
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

extension Array where Element: Hashable {
    func distinct() -> Array<Element> {
        var set = Set<Element>()
        return filter {
            guard !set.contains($0) else { return false }
            set.insert($0)
            return true
        }
    }
}

class ShadowView: UIView {
    /// The corner radius of the `ShadowView`, inspectable in Interface Builder
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.updateProperties()
        }
    }
    /// The shadow color of the `ShadowView`, inspectable in Interface Builder
    @IBInspectable var shadowColor: UIColor = UIColor.white {
        didSet {
            self.updateProperties()
        }
    }
    /// The shadow offset of the `ShadowView`, inspectable in Interface Builder
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            self.updateProperties()
        }
    }
    /// The shadow radius of the `ShadowView`, inspectable in Interface Builder
    @IBInspectable var shadowRadius: CGFloat = 4.0 {
        didSet {
            self.updateProperties()
        }
    }
    /// The shadow opacity of the `ShadowView`, inspectable in Interface Builder
    @IBInspectable var shadowOpacity: Float = 0.5 {
        didSet {
            self.updateProperties()
        }
    }
    
    /**
     Masks the layer to it's bounds and updates the layer properties and shadow path.
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.masksToBounds = false
        self.updateProperties()
        self.updateShadowPath()
        
    }
    
    /**
     Updates all layer properties according to the public properties of the `ShadowView`.
     */
    fileprivate func updateProperties() {
        self.layer.cornerRadius = self.cornerRadius
        self.layer.shadowColor = self.shadowColor.cgColor
        self.layer.shadowOffset = self.shadowOffset
        self.layer.shadowRadius = self.shadowRadius
        self.layer.shadowOpacity = self.shadowOpacity
    }
    
    /**
     Updates the bezier path of the shadow to be the same as the layer's bounds, taking the layer's corner radius into account.
     */
    fileprivate func updateShadowPath() {
        self.layer.shadowPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: layer.cornerRadius).cgPath
    }
    
    /**
     Updates the shadow path everytime the views frame changes.
     */
    override func layoutSubviews() {
        super.layoutSubviews()
        self.updateShadowPath()
    }
}
