//
//  TransitionAnimationViewController.swift
//  AnimationDemo
//
//  Created by Manas Mishra on 23/07/17.
//  Copyright © 2017 Manas Mishra. All rights reserved.
//

import UIKit

class TransitionAnimationViewController: UIViewController {
    var moveAlongPath: CAAnimation!

    @IBOutlet weak var viewToBeAnimated: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func addAnimation() {
        
        let moveAlongPath1 = CATransition()
        moveAlongPath1.endProgress = 0.6
        moveAlongPath1.startProgress = 0.1
        moveAlongPath1.subtype = "fromLeft"
        moveAlongPath1.type = kCATransitionPush
       
        self.moveAlongPath = moveAlongPath1
        
    }
    func initiateAnimation() {
        let layer = createLayer()
        layer.add(moveAlongPath, forKey: "animate along Path")
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
    func createCurvePath() -> UIBezierPath {
        let path = UIBezierPath()
        // path.move(to: CGPoint(x: 0, y: 0))
        path.move(to: viewToBeAnimated.frame.origin)
        //        //path.addQuadCurve(to: CGPoint(x: view.frame.width, y: view.frame.height), controlPoint: CGPoint(x: view.frame.width/2, y: view.frame.height/2) )
        //        path.addCurve(to: CGPoint(x: 0, y: 0), controlPoint1: CGPoint(x: 0, y: view.frame.height/2), controlPoint2: CGPoint(x: view.frame.width, y: view.frame.height/2))
        path.addLine(to: CGPoint(x: viewToBeAnimated.frame.origin.x, y: 0))
        return path
    }
    func createLayer() -> CALayer {
        let customlayer = viewToBeAnimated.layer
        return customlayer
    }
    @IBAction func start(_ sender: Any) {
        // addAnimation()
        initiateAnimation()
        
    }

}
