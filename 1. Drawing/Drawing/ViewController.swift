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
    
    //
    // The update function is called to draw the view automatically.
    //
    override func update() {
        // background erases the view and sets the entire view to one flat
        // color. If you want a different background color, change it here.
        background(gray: 0.9)
        
        // *************************************************
        // Insert your drawing code here, below this comment
        
        //Ears
            // Outer
            fillColor(gray: 0.7)
            strokeDisable()
                // L ear
                triangle(x1: 45, y1: 400, x2: 95, y2: 575, x3: 155, y3: 400)
                triangle(x1: 45, y1: 400, x2: 85, y2: 300, x3: 155, y3: 400)
                // R ear
                triangle(x1: 255, y1: 400, x2: 315, y2: 575, x3: 365, y3: 400)
                triangle(x1: 255, y1: 400, x2: 325, y2: 300, x3: 365, y3: 400)
            strokeColor(gray: 0)
                line(x1: 45, y1: 400, x2: 95, y2: 575)
                line(x1: 95, y1: 575, x2: 155, y2: 400)
                line(x1: 45, y1: 400, x2: 85, y2: 300)
                line(x1: 255, y1: 400, x2: 315, y2: 575)
                line(x1: 315, y1: 575, x2: 365, y2: 400)
                line(x1: 315, y1: 300, x2: 365, y2: 400)
            // Inner
            strokeColor(gray: 0)
            fillColor(red: 255/255, green: 182/255, blue: 193/255, alpha: 1)
                // L ear
                triangle(x1: 60, y1: 250, x2: 95, y2: 575, x3: 135, y3: 250)
                // R ear
                triangle(x1: 275, y1: 250, x2: 315, y2: 575, x3: 350, y3: 250)
        
        // Face fill
        strokeDisable()
        fillColor(gray: 1)
            rect(x: 122, y: 100, width: 166, height: 300)
            rect(x: 60, y: 150, width: 290, height: 200)
        
        // Nose
        fillColor(gray: 1)
            triangle(x1: 107, y1: 475, x2: 205, y2: 100, x3: 303, y3: 475)
        fillColor(red: 255/255, green: 182/255, blue: 193/255, alpha: 1)
        strokeColor(gray: 0)
            triangle(x1: 172, y1: 150, x2: 205, y2: 100, x3: 238, y3: 150)
        
        // Cheeks
        fillColor(gray: 1)
        strokeDisable()
            // L
            triangle(x1: 25, y1: 342, x2: 0, y2: 300, x3: 122, y3: 150)
            triangle(x1: 25, y1: 342, x2: 122, y2: 150, x3: 153, y3: 300)
            // R
            triangle(x1: 257, y1: 300, x2: 288, y2: 150, x3: 385, y3: 342)
            triangle(x1: 385, y1: 342, x2: 288, y2: 150, x3: 410, y3: 300)
        
        // Eyes
        fillColor(gray: 0.7)
        strokeColor(gray: 0)
            //L eye
            triangle(x1: 25, y1: 342, x2: 107, y2: 475, x3: 153, y3: 300)
            triangle(x1: 55, y1: 290, x2: 75, y2: 326, x3: 153, y3: 300)
            //R eye
            triangle(x1: 257, y1: 300, x2: 303, y2: 475, x3: 385, y3: 342)
            triangle(x1: 257, y1: 300, x2: 335, y2: 326, x3: 355, y3: 290)
            //Pupils
        fillColor(gray: 0)
            triangle(x1: 75, y1: 326, x2: 95, y2: 355, x3: 153, y3: 300)
            triangle(x1: 257, y1: 300, x2: 315, y2: 355, x3: 335, y3: 326)
        
        
        
        // Forehead
        fillColor(gray: 0.7)
        triangle(x1: 165, y1: 475, x2: 205, y2: 400, x3: 245, y3: 475)
        
        // Your drawing code should be above this comment.
        // *************************************************
        
        view?.stopUpdates()
    }
    
}

