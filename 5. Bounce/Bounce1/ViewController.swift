//
//  ViewController.swift
//  Drawing
//


import Cocoa
import Tin


class ViewController: TController {

    override func viewWillAppear() {
        view.window?.title = "Bounce"
        makeView(width: 800.0, height: 600.0)
        let scene = Scene()
        present(scene: scene)
    }

}


class Scene: TScene {
    
    var positionX = 400.0
    var positionY = 300.0
    var radius = 30.0
    var velocityX = 4.5
    var velocityY = -1.5
    
    var r = random(max: 1.0)
    var g = random(max: 1.0)
    var b = random(max: 1.0)
    
    //
    // The setup function is called once, right after the
    // Scene object is created, before the update function
    // is called for the first time.
    //
    override func setup() {
        view?.showStats = false
    }
    
    
    //
    // The update function is called to draw the view automatically.
    //
    override func update() {
        // background erases the view and sets the entire view to one flat
        // color. If you want a different background color, change it here.
        background(gray: 0.5)
        
        drawBorder()
        moveBall()
        drawBall()
        
    }
    
    func drawBorder() {
        fillColor(gray: 1)
        rect(x: 100, y: 100, width: tin.width - 200, height: tin.height - 200)
    }
    
    func moveBall() {
        positionX = positionX + velocityX
        positionY = positionY + velocityY
    
        if positionX + radius > tin.width - 100 {
            // ran off the right edge
            positionX = (tin.width-100) - radius
            velocityX = velocityX * -1.0
            r = random(max: 1.0)
            g = random(max: 1.0)
            b = random(max: 1.0)
        }
        else if positionX - radius < 100 {
            // ran off the left edge
            positionX = radius + 100
            velocityX = velocityX * -1.0
            r = random(max: 1.0)
            g = random(max: 1.0)
            b = random(max: 1.0)
        }
        
        if positionY + radius > tin.height - 100 {
            // ran off the top edge
            positionY = (tin.height - 100) - radius
            velocityY = velocityY * -1.0
            r = random(max: 1.0)
            g = random(max: 1.0)
            b = random(max: 1.0)
        }
        else if positionY - radius < 100 {
            // ran off the bottom edge
            positionY = radius + 100
            velocityY = velocityY * -1.0
            r = random(max: 1.0)
            g = random(max: 1.0)
            b = random(max: 1.0)
        }
    }
    
    func drawBall() {
        strokeColor(gray: 0)
        fillColor(red: r, green: g, blue: b, alpha: 1)
        ellipse(centerX: positionX, centerY: positionY, width: radius * 2, height: radius * 2)
        
    }
    
}

