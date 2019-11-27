//
//  ViewController.swift

//

import Cocoa
import Tin


class ViewController: TController {

    var scene: Scene!
    
    override func viewWillAppear() {
        super.viewWillAppear()
        view.window?.title = "Abstract Portrait"
        makeView(width: 468.0, height: 739.0)
        scene = Scene()
        present(scene: scene)
        scene.view?.showStats = false
    }

}


class Scene: TScene {
    
    var referencePhoto: TImage!
    
    
    override func setup() {
        referencePhoto = TImage(contentsOfFileInBundle: "Khaleesi.jpg")
        referencePhoto.loadPixels()
        
    }
    
    
    override func update() {
        background(gray: 0.0)
        
        let gridSize = 20.0 //Set the size of the grid here
        var y = 10.0                         //Create a grid to draw on
        while y < tin.height + gridSize {    //using x and y variables
            var x = 10.0                     //that extend out of view
            while x < tin.width + gridSize { //by one row and column
                for _ in 1...20 {
                    let dx = random(min: -10.0, max: 10.0) //Add variation by ofsetting
                    let dy = random(min: -10.0, max: 10.0) //the pixel selection on the grid
                    
                    let sx = x + dx //Create values to feed into
                    let sy = y + dy //the parameters of our function
                    
                    paint(sx: sx, sy: sy) //Call the paint function from below
                    
                }
                
                x += gridSize
            }
            
            y += gridSize
        }
        
        view?.stopUpdates()
        
    }
    
    func paint(sx: Double, sy: Double) {
        let ix = Int(sx) //Turn the pixel's x value into an integer
        let iy = Int(sy) //Turn the pixel's y value into an integer
        let c = referencePhoto.color(atX: ix, y: iy) //Grab the color values at the x,y coordinate
        let w = random(min: 10.0, max: 20.0) //Draw "brush strokes"
        let h = random(min: 5.0, max: 10.0)  //as ovals to show rotation
        
        pushState()
        c.setFillColor() //Set the fill to the color at the pixel location of var c
        strokeDisable()
        
        //In order to rotate by luminance, first scale the value of luminance to degrees in a circle
        let lScale = remap(value: c.luminance(), start1: 1.0, stop1: 0.0, start2: 0.0, stop2: 360.0)
        //Then convert that scaled value into radians
        let r = toRadians(degrees: lScale)
        
        translate(dx: sx, dy: sy) //Translate the pixel to allow rotation at the origin
        rotate(by: r)             //Then rotate using our radian value
        
        var dx = 0.0 //Create var for "stroke" trail
        var dy = 0.0 //which is basically the oval redrawn
        for i in 1...20 {   //Use the counting variable i to create a gradually fading alpha
                            //and scale that value to 1.0 and 0.0
            let alpha = remap(value: Double(i), start1: 1, stop1: 20, start2: 1.0, stop2: 0.0)
            setAlpha(alpha)
            ellipse(centerX: dx, centerY: dy, width: w, height: h) //Draw the oval
            dx += random(min: 0.1, max: 0.5) //Offset the center of the oval
            dy += random(min: 0.5, max: 1.0) //to create the stroke effect
        }
        popState()
        
    }
}
