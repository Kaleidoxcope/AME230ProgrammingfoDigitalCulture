//
//  Box.swift
//  TheHatch
//
//

import Foundation
import Tin


// Possible states for the Box lid
enum LidState {
    case closed
    case opening
    case open
    case closing
}


class Box {
    var x = 400.0
    var y = 150.0
    var width = 200.0 // how big the box is
    var wallThickness = 20.0
    var angle = 0.0 // angle of the lid
    var state = LidState.closed
    var color = 0.7
    
    
    // Update the movement of the lid.
    func update() {
        if state == .opening {
            angle += 0.1
            if angle >= .pi {
                angle = .pi
                nextState()
            }
        }
        else if state == .closing {
            angle -= 0.1
            if angle <= 0.0 {
                angle = 0.0
                nextState()
            }
        }
    }
    
    
    // Render the box and the lid.
    func render() {
        // FIX 2. ADD CODE HERE ****************************************
        // What is needed here:
        //    a. Draw the colored background of the box.
        strokeDisable()
        fillColor(gray: color)
        rect(x: x, y: y, width: width + wallThickness, height: width)
        fillColor(red: 0, green: 0, blue: 1, alpha: angle/Double.pi - 0.5)
        rect(x: x, y: y, width: width + wallThickness, height: width)
        //    b. Draw the left, bottom, and right edges of box.
        fillColor(gray: 1)
        strokeEnable()
        rect(x: x, y: y, width: wallThickness, height: width) //left side
        rect(x: x + wallThickness, y: y, width: width, height: wallThickness) // bottom side
        rect(x: x + wallThickness + width, y: y, width: wallThickness, height: width) // right side
        //    c. Draw the box lid. (remember, it rotates!)
        pushState()
        translate(dx: x, dy: y + width)
        rotate(by: angle)
        rect(x: 0, y: 0, width: width + (2 * wallThickness), height: wallThickness)
        popState()
    }
    
    
    // Change the box to the next state. The possible state transitions are:
    //    closed to opening
    //    opening to open
    //    open to closing
    //    closing to closed
    func nextState() {
        
        // FIX 3. ADD CODE HERE ****************************************
        // What is needed here:
        //    Change the state property, to transition it to its next value.
        if state == LidState.closed {
            state = LidState.opening
        }
        else if state == LidState.opening {
            state = LidState.open
        }
        else if state == LidState.open {
            state = LidState.closing
        }
        else if state == LidState.closing {
            state = LidState.closed
        }
    }
    
    
    func isOpening() -> Bool {
        return state == .opening
    }
    
    
    func isClosing() -> Bool {
        return state == .closing
    }
}
