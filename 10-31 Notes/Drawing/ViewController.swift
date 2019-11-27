//
//  ViewController.swift
//  Drawing
//


import Cocoa
import Tin


class ViewController: TController {

    override func viewWillAppear() {
        view.window?.title = "Drawing"
        makeView(width: 800.0, height: 600.0)
        let scene = Scene()
        present(scene: scene)
    }

}


class Scene: TScene {
    var theta = 0.0
    //
    // The update function is called to draw the view automatically.
    //
    override func update() {
        background(gray: 0)
       
        grid()
        fillColor(red: 1, green: 1, blue: 0, alpha: 1)
        pushState() //whatever code that goes betweeen pushState() and popState() only applies to the objects between them
        translate(dx: 400, dy: 300)
        rotate(by: theta) // rotate always originates the rotation at (0,0)
        rect(x: -25, y: -25, width: 50, height: 50) // the center of this square is at (0,0)
        popState()
        
        translate(dx: 500, dy: 300)
        rotate(by: -theta)
        rect(x: -25, y: -25, width: 50, height: 50) // the center of this square is at (0,0)
        theta += 0.02
        

//        fillColor(red: 1, green: 0, blue: 0, alpha: 1)
//        ellipse(centerX: -100, centerY: 0, width: 50.0, height: 50.0)
//
//        fillColor(red: 0, green: 1, blue: 0, alpha: 1)
//        ellipse(centerX: 100, centerY: 0, width: 50.0, height: 50.0)
//
//        fillColor(red: 0, green: 0, blue: 1, alpha: 1)
//        ellipse(centerX: 0, centerY: 100, width: 50.0, height: 50.0)
        
        
    //view?.stopUpdates()
    }
    
    func grid() { //draw a grid
        strokeColor(gray: 1)
        lineWidth(1)
        var y = 0.0
        while y < tin.height {
            line(x1: 0, y1: y, x2: tin.width, y2: y)
            y = y + 50.0
        }
        var x = 0.0
        while x < tin.width {
            line(x1: x, y1: 0, x2: x, y2: tin.height)
            x += 50.0
        }
    }
    
}

