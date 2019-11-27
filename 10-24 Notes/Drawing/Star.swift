//
//  Star.swift
//  Drawing
//
//  Created by Thao on 10/22/18.
//  Copyright © 2018 ASU. All rights reserved.
//

import Foundation
import Tin

class Star {
    var x: Double
    var y: Double
    var radius: Double
    var angle: Double // the rotating angle of the star
    var numberOfPoints: Int //the number of points on the star
    var armDepth: Double //the ratio of the distance from the outer points to the inner points
    var speed = random(max: 1.0) //how fast the star rotates
    var red: Double
    var green: Double
    var blue: Double
    
    init(x: Double, y: Double, radius: Double) { // set the initial values of the stars
        self.x = x
        self.y = y
        self.radius = radius
        angle = random(min: 0, max: Double.pi)
        numberOfPoints = 5
        armDepth = 0.4
        speed = random(min: 0.005, max: 0.015)
        red = random(max: 1.0)
        green = random(max: 1.0)
        blue = random(max: 1.0)
    }
    
    func spin() {
     angle = angle + speed
    }
    
    func render() { //function to draw the star
        var a = angle // the rotation of the star
        
        let offset = (Double.pi * 2.0) / Double(numberOfPoints)
        strokeDisable()
        fillColor(red: red, green: green, blue: blue, alpha: 1)
        pathBegin()
        
        for _ in 1...numberOfPoints { //_ is used to hide a variable
            //outside points
            let x1 = radius * cos(a) + x //a point on the circle
            let y1 = radius * sin(a) + y //a point on the circle
            pathVertex(x: x1, y: y1)
            a = a + offset / 2.0 // move the dot
            
            
            //inside points
            let x2 = radius * 0.4 * cos(a) + x //a point on the circle
            let y2 = radius * 0.4 * sin(a) + y //a point on the circle
            pathVertex(x: x2, y: y2)
            a = a + offset / 2.0 // move the dot
        }
        pathClose()
    }
}
