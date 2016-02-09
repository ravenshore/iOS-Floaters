//
//  floater.swift
//  floaters
//
//  Created by Razvigor Andreev on 2/8/16.
//  Copyright © 2016 Razvigor Andreev. All rights reserved.
//

import UIKit

@IBDesignable public class Floater: UIView {
    

    var image1: UIImage?
    var image2: UIImage?
    var image3: UIImage?
    var image4: UIImage?
    
    var isAnimating: Bool = true
    var views: [UIView]!
    var duration: NSTimeInterval = 1.0
    var duration1: NSTimeInterval = 2.0
    var duration2: NSTimeInterval = 2.0
    var floatieSize = CGSize(width: 50, height: 50)
    var floatieDelay: Double = 10
    var delay: Double = 10.0
    var startingAlpha: CGFloat = 1.0
    var endingAlpha: CGFloat = 0.0
    var upwards: Bool = true
    var remove: Bool = true
    
    @IBInspectable var removeAtEnd: Bool = true {
        didSet {
            remove = removeAtEnd
        }
    }
    @IBInspectable var FloatingUp: Bool = true {
        didSet {
            upwards = FloatingUp
        }
    }
    @IBInspectable var alphaAtStart: CGFloat = 1.0 {
        didSet {
            startingAlpha = alphaAtStart
        }
    }
    @IBInspectable var alphaAtEnd: CGFloat = 0.0 {
        didSet {
            endingAlpha = alphaAtEnd
        }
    }
    @IBInspectable var rotationSpeed: Double = 10 {
        didSet {
            duration2 = 20 / rotationSpeed
        }
    }
    @IBInspectable var density: Double = 10 {
        didSet {
            floatieDelay = 1 / density
        }
    }
    @IBInspectable var delayedStart: Double = 10 {
        didSet {
            delay = delayedStart
        }
    }
    @IBInspectable var speedY: CGFloat = 10 {
        didSet {
            duration = Double(10/speedY)
        }
    }
    @IBInspectable var speedX: CGFloat = 5 {
        didSet {
            duration1 = Double(10/speedX)
        }
    }
    @IBInspectable var floatieWidth: CGFloat = 50 {
        didSet {
            floatieSize.width = floatieWidth
        }
    }
    @IBInspectable var floatieHeight: CGFloat = 50 {
        didSet {
            floatieSize.height = floatieHeight
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var floaterImage1: UIImage? {
        didSet {
            image1 = floaterImage1
        }
    }
    @IBInspectable var floaterImage2: UIImage? {
        didSet {
            image2 = floaterImage2
        }
    }
    @IBInspectable var floaterImage3: UIImage? {
        didSet {
            image3 = floaterImage3
        }
    }
    @IBInspectable var floaterImage4: UIImage? {
        didSet {
            image4 = floaterImage4
        }
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func startAnimation() {
        
        isAnimating = true
        views = []
        var imagesArray = [UIImage?]()
        var actualImages = [UIImage]()
        let frameW = self.frame.width
        let frameH = self.frame.height
        var startingPoint: CGFloat!
        var endingPoint: CGFloat!
        if upwards {
            startingPoint = frameH
            endingPoint = floatieHeight*2
        } else {
            startingPoint = 0
            endingPoint = frameH - floatieHeight*2
        }
        imagesArray += [image1, image2, image3, image4]
        if !imagesArray.isEmpty {
        for i in imagesArray {
            if i != nil {
                actualImages.append(i!)
            }
        }
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            
            var next = true
            while self.isAnimating {
                if next {
                    next = false
                    
                    
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(self.floatieDelay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
                        
                        let randomNumber = self.randomIntBetweenNumbers(1, secondNum: 2)
                        var randomRotation: CGFloat!
                        if randomNumber == 1 {
                            randomRotation = -1
                        } else {
                            randomRotation = 1
                        }
                        let randomX = self.randomFloatBetweenNumbers(0 + self.floatieSize.width/2, secondNum: self.frame.width - self.floatieSize.width/2)
                        let floatieView = UIView(frame: CGRect(x: randomX, y: startingPoint, width: 50, height: 50))
                        self.addSubview(floatieView)
                        
                        let floatie = UIImageView(frame: CGRect(x: 0, y: 0, width: self.floatieSize.width, height: self.floatieSize.height))
                        
                        if !actualImages.isEmpty {
                            
                            let randomImageIndex = (self.randomIntBetweenNumbers(1, secondNum: actualImages.count) - 1 )
                            floatie.image = actualImages[randomImageIndex]
                            floatie.center = CGPoint(x: 0, y: 0)
                            floatie.backgroundColor = UIColor.clearColor()
                            floatie.layer.zPosition = 10
                            floatie.alpha = self.startingAlpha
                            
                            floatieView.addSubview(floatie)
                            var xChange: CGFloat!
                            if randomX < self.frame.width/2 {
                                xChange = randomX + self.randomFloatBetweenNumbers(randomX, secondNum: frameW-randomX)
                            } else {
                                xChange = self.randomFloatBetweenNumbers(self.floatieSize.width*2, secondNum: randomX)
                            }
                            self.views.append(floatieView)
                            UIView.animateWithDuration(self.duration, delay: 0,
                                options: [], animations: {
                                    floatieView.center.y = endingPoint
                                    floatie.alpha = self.endingAlpha
                                    next = true
                                }, completion: {(value: Bool) in
                                    if self.remove {
                                    floatieView.removeFromSuperview()
                                    }
                            })
                            UIView.animateWithDuration(self.duration1, delay: 0,
                                options: [.Repeat, .Autoreverse], animations: {
                                    floatieView.center.x = xChange
                                }, completion: nil)
                            UIView.animateWithDuration(self.duration2, delay: 0, options: [.Repeat, .Autoreverse], animations: {                 floatieView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2)*randomRotation)
                                }, completion: nil)
                            
                        }
                    })
                }
            }
            
        }
    }
    
    func stopAnimation() {
        
        views = []
        isAnimating = false
        if !views.isEmpty {
            for i in views {
                i.removeFromSuperview()
            }
        }
    }
    
    func randomFloatBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
    func randomIntBetweenNumbers(firstNum: Int, secondNum: Int) -> Int{
        return firstNum + Int(arc4random_uniform(UInt32(secondNum - firstNum + 1)))
    }
    
    
}