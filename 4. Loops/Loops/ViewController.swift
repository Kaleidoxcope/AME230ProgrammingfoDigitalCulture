//
//  ViewController.swift
//  Loops
//


import Cocoa
import Tin

var scene: Scene!
class ViewController: TController {

    
    
    override func viewWillAppear() {
        view.window?.title = "Loops"
        makeView(width: 800.0, height: 600.0)
        scene = Scene()
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
        background(red: 149/255, green: 200/255, blue: 216/255)
        
        // *************************************************
        // Insert your drawing code here, below this comment
        
        var diameter = 40.0
        var bottomY = 0.0
        var mountAleftX = -300.0
        var mountBleftX = 0.0
        let cenX = tin.width/2
        var mountCleftX = cenX
        var mountArightX = cenX + 100.0
        var mountBrightX = tin.width
        var mountCrightX = tin.width + 200.0
        var clouds = 1
        var cloudX = -50.0
        var darkTrees = 1
        var darkTreesX = -10.0
        var lightTrees = 1
        var lightTreesX = -10.0
        strokeDisable()
        
        //Sun
        fillColor(red: 1, green: 1, blue: 0, alpha: 0.2)
        while diameter < 300 {
            ellipse(centerX: cenX - 200, centerY: tin.height, width: diameter, height: diameter)
            diameter += 20.0
            bottomY += 50
        }
        
        //Almighty Mountain A
        fillColor(red: 70/255, green: 55/255, blue: 76/255, alpha: 0.2)
        while mountAleftX < cenX/2 || mountArightX > cenX/2 {
            triangle(x1: mountAleftX, y1: 0, x2: cenX/2, y2: tin.height - 250, x3: mountArightX, y3: 0)
            mountAleftX += 10
            mountArightX -= 10
        }
        
        //Mountain mist
        fillColor(gray: 0.8, alpha: 0.2)
        while clouds <= 60 {
            ellipse(centerX: cloudX, centerY: random(min: 100, max: 275), width: random(min: 100, max: 300), height: random(min: 50, max: 100))
            clouds += 1
            cloudX += random(min: 0, max: 100)
            if cloudX >= tin.width {
                cloudX = 0.0
            }
        }
        
        //Almighty Mountain C
        fillColor(red: 79/255, green: 64/255, blue: 86/255, alpha: 0.2)
        while mountCleftX < 3*cenX/2 || mountCrightX > 3*cenX/2 {
            triangle(x1: mountCleftX, y1: 0, x2: cenX+325, y2: tin.height - 250, x3: mountCrightX, y3: 0)
            mountCleftX += 10
            mountCrightX -= 10
        }
        
        //Mountain mist
        fillColor(gray: 0.9, alpha: 0.2)
        clouds = 0
        cloudX = 0
        while clouds <= 60 {
            ellipse(centerX: cloudX, centerY: random(min: 100, max: 250), width: random(min: 100, max: 300), height: random(min: 50, max: 100))
            clouds += 1
            cloudX += random(min: 0, max: 100)
            if cloudX >= tin.width {
                cloudX = 0.0
            }
        }
        
        //Almighty Mountain B
        fillColor(gray: 0.4, alpha: 0.2)
        while mountBleftX < cenX {
            triangle(x1: mountBleftX, y1: 0, x2: cenX, y2: tin.height - 150, x3: mountBrightX, y3: 0)
            mountBleftX += 10
            mountBrightX -= 10
        }
        
        //Mountain mist
        fillColor(gray: 1, alpha: 0.2)
        clouds = 0
        cloudX = 0
        while clouds <= 50 {
            ellipse(centerX: cloudX, centerY: random(min: 100, max: 200), width: random(min: 100, max: 300), height: random(min: 50, max: 100))
            clouds += 1
            cloudX += random(min: 0, max: 100)
            if cloudX >= tin.width {
                cloudX = 0.0
            }
        }
        
        //Dark trees
        fillColor(red: 13/255, green: 43/255, blue: 17/255, alpha: 0.8)
        while darkTrees <= 100 {
            ellipse(centerX: darkTreesX, centerY: random(min: -20, max: 120), width: random(min: 50, max: 100), height: random(min: 50, max: 100))
            darkTrees += 1
            darkTreesX += random(min: 0, max: 50)
            if darkTreesX >= tin.width {
                darkTreesX = 0.0
            }
        }
        
        //Light trees
        fillColor(red: 34/255, green: 142/255, blue: 24/255, alpha: 0.3)
        while lightTrees <= 80 {
            ellipse(centerX: lightTreesX, centerY: random(min: -30, max: 110), width: random(min: 50, max: 100), height: random(min: 50, max: 100))
            lightTrees += 1
            lightTreesX += random(min: 0, max: 50)
            if lightTreesX >= tin.width {
                lightTreesX = 0.0
            }
        }
        
        // Your drawing code should be above this comment.
        // *************************************************
        
        view?.stopUpdates()
    }
    
}

