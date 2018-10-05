//
//  DotView.swift
//  PyiKyaw-Lab3
//
//  Created by Pyi Theim Kyaw on 10/3/18.
//  Copyright © 2018 Pyi Theim Kyaw. All rights reserved.
//

import UIKit

class DotView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    var theDot: Dot? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    var dots: [Dot] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    override func draw(_ rect: CGRect) {
        print("this many lines \(dots.count)")
        
        for a in dots{
            let path = createQuadPath(points: a.points)
            a.color.set()
            path.lineWidth = a.thickness
            path.stroke()
        }
        
        if (theDot != nil) {
            let path = createQuadPath(points: (theDot?.points)!)
            theDot?.color.set()
            path.lineWidth = (theDot?.thickness)!
            path.stroke()
        }
    
    }
    
    
    func createQuadPath(points: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath()
        if points.count < 2 { return path }
        let firstPoint = points[0]
        let secondPoint = points[1]
        let firstMidpoint = midpoint(first: firstPoint, second: secondPoint)
        path.move(to: firstPoint)
        path.addQuadCurve(to: secondPoint, controlPoint: firstMidpoint)
        path.addLine(to: firstMidpoint)
        for index in 1 ..< points.count-1 {
            let currentPoint = points[index]
            let nextPoint = points[index + 1]
            let midPoint = midpoint(first: currentPoint, second: nextPoint)
            path.addQuadCurve(to: midPoint, controlPoint: currentPoint)
        }
        guard let lastLocation = points.last else { return path }
        path.addLine(to: lastLocation)
        path.lineCapStyle = .round
        return path
    }
    
    
    private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        let midX = (first.x + second.x)/2
        let midY = (first.y + second.y)/2
        return CGPoint(x: midX, y: midY)
    }
}
