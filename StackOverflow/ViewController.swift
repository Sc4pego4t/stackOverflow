//
//  ViewController.swift
//  StackOverflow
//
//  Created by Андрей Глухих on 30.06.2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var mainCurveView: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		mainCurveView.addBottomRoundedEdge(desiredCurve: 1.5)

	}
	
	override func viewDidLayoutSubviews() {
		mainCurveView.layer.shadowRadius = 10
		mainCurveView.layer.shadowOpacity = 1
		mainCurveView.layer.shadowColor = UIColor.gray.cgColor
		mainCurveView.layer.shadowOffset = CGSize(width: 0 , height:2)
	}
}


extension UIView {
	
	func addBottomRoundedEdge(desiredCurve: CGFloat?) {
		let radius: CGFloat = 50
		let bounds: CGRect = self.bounds
		
		let path: UIBezierPath = UIBezierPath()
		path.move(to: CGPoint(x: 0, y: 0))
		path.addLine(to: CGPoint(x: bounds.maxX, y: 0))
		path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY - radius))
		
		path.addCurve(to: CGPoint(x: 0, y: bounds.maxY - radius), controlPoint1: CGPoint(x: bounds.maxX, y: bounds.maxY), controlPoint2: CGPoint(x: 0, y: bounds.maxY))
		path.close()
		
		let layer = CAShapeLayer()
		layer.path = path.cgPath
		layer.shadowPath = path.cgPath
		layer.shadowRadius = 10
		
		layer.shadowOpacity = 1
		
		layer.shadowColor = UIColor.gray.cgColor
		
		layer.shadowOffset = CGSize(width: 0 , height:2)
		
		self.layer.addSublayer(layer)
		self.setNeedsDisplay()
	}
}
