//
//  CircularProgressBar.swift
//  Happ
//
//  Created by Anik on 13/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

@IBDesignable
class CircularProgressBar: UIView {
    
    //MARK: awakeFromNib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        progressLabel.text = "0"
        unitLabel.text = "Units"
    }
    
    
    //MARK: Public
    /// The minimum value for the slider
    ///
    /// - Note: If you set this to above `maximum` or `value`, those values will be changed to match
    @IBInspectable open var minimum: Float = 0 {
        didSet {
            if maximum < minimum { maximum = minimum }
            if value < minimum { value = minimum }
            //renderer.setValue(value)
            //updateAccessibility()
        }
    }
    
    /// The maximum value for the slider
    ///
    /// - Note: If you set this to below `minimum` or `value`, those values will be changed to match
    @IBInspectable open var maximum: Float = 1 {
        didSet {
            if minimum > maximum { minimum = maximum }
            if value > maximum { value = maximum }
            //renderer.setValue(value)
            //updateAccessibility()
        }
    }
    
    /// The current (or starting) value for the slider
    @IBInspectable open private(set) var value: Float = 0.5 {
        didSet(oldValue) {
            if oldValue != value {
                if value < minimum { value = minimum }
                if value > maximum { value = maximum }
                //updateAccessibility()
                setProgress(to: Double(value), withAnimation: true)
            }
        }
    }
    
    @IBInspectable public var lineWidth: CGFloat = 50 {
        didSet{
            foregroundLayer.lineWidth = lineWidth
            backgroundLayer.lineWidth = lineWidth //- (0.20 * lineWidth)
        }
    }
    
    @IBInspectable open var trackBackground: UIColor = UIColor.lightGray {
        didSet {
            self.backgroundLayer.strokeColor = trackBackground.cgColor
        }
    }
    
    @IBInspectable open var progressBackground: UIColor = UIColor.darkGray {
        didSet {
            foregroundLayer.strokeColor = progressBackground.cgColor
        }
    }
    
    @IBInspectable open var progressLabelFont: UIFont = UIFont.boldSystemFont(ofSize: 23) {
        didSet {
            progressLabel.font = progressLabelFont
            progressLabel.sizeToFit()
            configLabel()
        }
    }
    
    public var labelSize: CGFloat = 20 {
        didSet {
            progressLabel.font = UIFont.systemFont(ofSize: labelSize)
            progressLabel.sizeToFit()
            configLabel()
        }
    }
    
    public var safePercent: Int = 100 {
        didSet{
            setForegroundLayerColorForSafePercent()
        }
    }
    
    public func setProgress(to progressConstant: Double, withAnimation: Bool) {
        
        var progress: Double {
            get {
                return Double((value - minimum) / (maximum - minimum))
                /*
                if progressConstant > 1 { return 1 }
                else if progressConstant < 0 { return 0 }
                else { return progressConstant }
 */
            }
        }
        
        foregroundLayer.strokeEnd = CGFloat(progress)
        
        if withAnimation {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0
            animation.toValue = progress
            animation.duration = 2
            animation.fillMode = .forwards
            animation.isRemovedOnCompletion = false
            foregroundLayer.add(animation, forKey: "foregroundAnimation")
            
        }
        
        var currentTime:Double = 0
        let timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (timer) in
            if currentTime >= 2{
                timer.invalidate()
            } else {
                currentTime += 0.05
                let percent = currentTime/2 //* 100
                let roundedProgress = Int(round(progress * percent * Double(self.maximum - self.minimum)))
                self.progressLabel.text = "\(roundedProgress)"
                //self.setForegroundLayerColorForSafePercent()
                self.foregroundLayer.strokeColor = self.progressBackground.cgColor
                self.configLabel()
            }
        }
        timer.fire()
        
    }
    
    //MARK: Private
    private var progressLabel = UILabel()
    private var unitLabel = UILabel()
    private let foregroundLayer = CAShapeLayer()
    private let backgroundLayer = CAShapeLayer()
    private var radius: CGFloat {
        get{
            if self.frame.width < self.frame.height { return (self.frame.width - lineWidth)/2 }
            else { return (self.frame.height - lineWidth)/2 }
        }
    }
    
    private var pathCenter: CGPoint{ get{ return self.convert(self.center, from:self.superview) } }
    private func makeBar(){
        self.layer.sublayers = nil
        drawBackgroundLayer()
        drawForegroundLayer()
    }
    
    private func drawBackgroundLayer(){
        let path = UIBezierPath(arcCenter: pathCenter, radius: self.radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        self.backgroundLayer.path = path.cgPath
        self.backgroundLayer.strokeColor = trackBackground.cgColor
        self.backgroundLayer.lineWidth = lineWidth - (lineWidth * 20/100)
        self.backgroundLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(backgroundLayer)
        
    }
    
    private func drawForegroundLayer(){
        
        let startAngle = (-CGFloat.pi/2)
        let endAngle = 2 * CGFloat.pi + startAngle
        
        let path = UIBezierPath(arcCenter: pathCenter, radius: self.radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        foregroundLayer.lineCap = CAShapeLayerLineCap.round
        foregroundLayer.path = path.cgPath
        foregroundLayer.lineWidth = lineWidth
        foregroundLayer.fillColor = UIColor.clear.cgColor
        foregroundLayer.strokeColor = progressBackground.cgColor
        foregroundLayer.strokeEnd = 0
        
        self.layer.addSublayer(foregroundLayer)
        
    }
    
    /*
    private func makeLabel(withText text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.text = text
        label.font = progressLabelFont
        label.sizeToFit()
        label.center = pathCenter
        return label
    }
    */
    private func configLabel(){
        progressLabel.sizeToFit()
        progressLabel.font = progressLabelFont
        progressLabel.center = pathCenter
        
        unitLabel.sizeToFit()
        unitLabel.center = pathCenter
        unitLabel.font = UIFont.systemFont(ofSize: 9)
        unitLabel.frame.origin.y = unitLabel.frame.origin.y + 18
    }
    
    private func setForegroundLayerColorForSafePercent(){
        if Int(progressLabel.text!)! >= self.safePercent {
            self.foregroundLayer.strokeColor = UIColor.green.cgColor
        } else {
            self.foregroundLayer.strokeColor = UIColor.red.cgColor
        }
    }
    
    private func setupView() {
        makeBar()
        self.addSubview(progressLabel)
        self.addSubview(unitLabel)
    }
    
    //Layout Sublayers
    private var layoutDone = false
    override func layoutSublayers(of layer: CALayer) {
        if !layoutDone {
            let tempText = progressLabel.text
            setupView()
            progressLabel.text = tempText
            layoutDone = true
        }
    }
    
}
