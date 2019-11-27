//
//  Letters.swift
//  TextScatter
//
//  Created by Thao on 11/29/18.
//  Copyright © 2018 ASU. All rights reserved.
//

import Foundation
import Tin

class Letter { // A class to draw each letter in the array
    var letter: String          // Declare types
    var homeX: Double           // for each of the
    var homeY: Double           // variables that
    var scatterX: Double        // will be used for
    var scatterY: Double        // each letter in
    var scatterAngle: Double    // the letter class.
    
    init(letter: String, homeX: Double, homeY: Double) { //initial values
        scatterX = random(max: tin.width)   // An x coordinate value when the letter is in the scatter position
        scatterY = random(max: tin.height)  // A y coordinate value when the letter is in the scatter position
        scatterAngle = random(min: 0.0, max: 2 * Double.pi) // An angle value for the rotation of the scattered letters
        self.homeX = homeX  // The x coordinate value when the letter is in the home position
        self.homeY = homeY  // The y coordinate value when the letter is in the home position
        self.letter = letter // The string value for variable letter is passed here
    }
    
    func render(t: Double, font: TFont) { // Function to draw each letter with parameters t(time) and font(TFont)
        fillColor(gray: 1) // Set font color
        
        pushState()
        // Use the t constant to transition the x, y values of the letters between home and scatter
        let positionX = remap(value: t, start1: 0, stop1: 1, start2: homeX, stop2: scatterX)
        let positionY = remap(value: t, start1: 0, stop1: 1, start2: homeY, stop2: scatterY)
        // Create a constant to scale the rotation of the letter between home(0) and scatterAngle in relation to t
        let angle = remap(value: t, start1: 0, stop1: 1, start2: 0, stop2: scatterAngle)
        
        translate(dx: positionX, dy: positionY) // Translate letters drawn at the origin
        rotate(by: angle) // Rotate letters
        
        // Each time the render function is called, draw the letter at the origin so that it can be translated and rotated
        text(message: letter, font: font, x: 0 , y: 0)
        
        popState()
    }
}


