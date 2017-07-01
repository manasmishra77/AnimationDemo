//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Manas Mishra on 01/07/17.
//  Copyright © 2017 Manas Mishra. All rights reserved.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {
    var moveAlongPath:CAAnimation!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addAnimation()
        initiateAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func curevedPath() -> UIBezierPath {
        
        let path = createCurvePath()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 1.0
        self.view.layer.addSublayer(shapeLayer)
        return path
    }
    func addAnimation() {
        let moveAlongPath = CAKeyframeAnimation(keyPath: "position")
        moveAlongPath.path = curevedPath().cgPath
        moveAlongPath.duration = 5
        moveAlongPath.repeatCount = HUGE
        moveAlongPath.calculationMode = kCAAnimationPaced
        moveAlongPath.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        self.moveAlongPath = moveAlongPath
    }
    func initiateAnimation() {
        let layer = createLayer()
        layer.add(moveAlongPath, forKey: "animate along Path")
    }
    
    //MARK:- Custom View Path
    func createLayer() -> CALayer {
        let customView  = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        customView.backgroundColor = UIColor.blue
        self.view.addSubview(customView)
        let customlayer = customView.layer
        customlayer.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
        customlayer.position = CGPoint(x: 25, y: 25)
        return customlayer
    }
    
    //MARK:- Custom Curve Path
    func createCurvePath() -> UIBezierPath {
        let path = UIBezierPath()
       // path.move(to: CGPoint(x: 0, y: 0))
        path.move(to: CGPoint(x: view.frame.width, y: view.frame.height))
        //path.addQuadCurve(to: CGPoint(x: view.frame.width, y: view.frame.height), controlPoint: CGPoint(x: view.frame.width/2, y: view.frame.height/2) )
        path.addCurve(to: CGPoint(x: 0, y: 0), controlPoint1: CGPoint(x: 0, y: view.frame.height/2), controlPoint2: CGPoint(x: view.frame.width, y: view.frame.height/2))
        return path
    }


   
}
