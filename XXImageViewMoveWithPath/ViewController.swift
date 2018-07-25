//
//  ViewController.swift
//  XXImageViewMoveWithPath
//
//  Created by shine on 2018/6/25.
//  Copyright © 2018年 shine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.frame = CGRect(x: 40, y: 190, width: 10, height: 10)
        imageView.center = CGPoint(x: 50, y: 150)
        
        //箭头和路径其实是叠加效果
        drawSemicicle()
        imageAnimationWithPath()
    }
    
    func drawSemicicle() -> Void {
        let center = CGPoint(x: 150, y: 150)
        let radius = 100
        let startA = -Double.pi
        let endA = 0
        
        let semiCirclePath = UIBezierPath(arcCenter: center, radius: CGFloat(radius), startAngle: CGFloat(startA), endAngle: CGFloat(endA), clockwise: true)
        
        let semiCircleLayer = CAShapeLayer()
        semiCircleLayer.fillColor = UIColor.clear.cgColor
        semiCircleLayer.strokeColor = UIColor.init(red: 207/255.0, green: 209/255.0, blue: 220/255.0, alpha: 1).cgColor
        semiCircleLayer.path = semiCirclePath.cgPath
        semiCircleLayer.lineWidth = 3.0
        view.layer.addSublayer(semiCircleLayer)
        
        let circleAnimation = CABasicAnimation()
        circleAnimation.keyPath = "strokeEnd"
        circleAnimation.duration = 5
        circleAnimation.fromValue = 0
        circleAnimation.toValue = 1
        circleAnimation.repeatCount = MAXFLOAT
        
        semiCircleLayer.add(circleAnimation, forKey: nil)
    }

    func imageAnimationWithPath() -> Void {
        let center = CGPoint(x: 150, y: 150)
        let radius = 100
        let startA = -Double.pi
        let endA = 0
        
        let semiCirclePath = UIBezierPath(arcCenter: center, radius: CGFloat(radius), startAngle: CGFloat(startA), endAngle: CGFloat(endA), clockwise: true)
        
        let keyAnimation = CAKeyframeAnimation()
        keyAnimation.keyPath = "position"
        keyAnimation.isRemovedOnCompletion = false
        keyAnimation.fillMode = "forwards"
        keyAnimation.duration = 5
        keyAnimation.repeatCount = MAXFLOAT
        //rotationMode让imageView根据路径自动旋转，这个很神奇了
        keyAnimation.rotationMode = "auto"
        keyAnimation.path = semiCirclePath.cgPath
        
        imageView.layer.add(keyAnimation, forKey: nil)
    }
}

