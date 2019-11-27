//
//  Ball.swift
//  BounceObjects
//
//  Created by Thao on 10/29/18.
//  Copyright © 2018 ASU. All rights reserved.
//

import Foundation
import Tin

class Ball { // This is the class
    var positionX = random(min: 100.0, max: tin.width - 100.0)
    var positionY = random(min: 100.0, max: tin.height - 100.0)
    var radius = 30.0       // These are the
    var velocityX = 4.5     // properties of
    var velocityY = -3.0    // the class
    var gravity = -0.5
    var bounciness = 0.95
    
    var red: Double
    var green: Double
    var blue: Double
    
    init() { //initial values
        red = random(max: 1.0)
        green = random(max: 1.0)
        blue = random(max: 1.0)
    }
    
    func move() { // Move the ball
        velocityY = velocityY + gravity
        positionX = positionX + velocityX
        positionY = positionY + velocityY
        
        let rightEdge = tin.width
        let leftEdge = 0.0
        let topEdge = tin.height
        let bottomEdge = 0.0
        
        // Check to see if the ball hit any edge
        if positionX + radius > rightEdge {
            // Hit the right edge
            positionX = rightEdge - radius
            velocityX = velocityX * -1.0 * bounciness
            velocityY *= bounciness
        }
        else if positionX - radius < leftEdge {
            // Hit the left edge
            positionX = radius + leftEdge
            velocityX = velocityX * -1.0 * bounciness
            velocityY *= bounciness
        }
        
        if positionY + radius > topEdge {
            // Hit the top edge
            positionY = topEdge - radius
            velocityY = velocityY * -1.0 * bounciness
            velocityX *= bounciness
        }
        else if positionY - radius < bottomEdge {
            // Hit the bottom edge
            positionY = radius + bottomEdge
            velocityY = velocityY * -1.0 * bounciness
            velocityX *= bounciness
        }
    }
    
    func render() {
        // **********************************************
        // Draw the ball
        //
        strokeColor(gray: 0.0)
        fillColor(red: red, green: green, blue: blue, alpha: 1)
        ellipse(centerX: positionX, centerY: positionY, width: radius * 2, height: radius * 2)
    }
}
