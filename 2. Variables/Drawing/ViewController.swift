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
    // A shooting star that starts at the top left of the screen
    var starX = 0.0
    var starY = 610.0
    // The trajectory of the shooting star
    var starfallX = 4.0
    var starfallY = -3.0
    
    
    //
    // The update function is called to draw the view automatically.
    //
    override func update() {
        //**Pallette**
        let darkGrey = 0.2
        let lightGrey = 0.6
        let black = 0.0
        
        //Background color
        background(red: tin.mouseX/1200.0, green: tin.mouseY/3200.0, blue: tin.mouseX/1000.0)
        
        //Shroud the sky in darkness.
        strokeDisable()
        fillColor(gray: darkGrey, alpha: 0.5)
        rect(x: 0, y: 0, width: 800, height: 600)
        
        //Draw a moon.
        fillColor(red: 241, green: 242, blue: 225, alpha: 1)
        ellipse(centerX: 600, centerY: 500, width: 150, height: 150)
        
        /*
         
         The face goes here.
         
         */
        
        //Set the center of the face to the mouse pointer.
        let faceCenterX = tin.mouseX
        let faceCenterY = tin.mouseY
        
        
        // Ears
        // Outer
        fillColor(gray: lightGrey)
        strokeColor(gray: black)
        // L ear
        triangle(x1: faceCenterX - 155, y1: faceCenterY + 300, x2: faceCenterX - 230, y2: faceCenterY + 90, x3: faceCenterX - 210, y3: faceCenterY + 45)
        triangle(x1: faceCenterX - 155, y1: faceCenterY + 300, x2: faceCenterX - 125, y2: faceCenterY + 175, x3: faceCenterX - 100, y3: faceCenterY + 175)
        // R ear
        triangle(x1: faceCenterX + 155, y1: faceCenterY + 300, x2: faceCenterX + 230, y2: faceCenterY + 90, x3: faceCenterX + 210, y3: faceCenterY + 45)
        triangle(x1: faceCenterX + 155, y1: faceCenterY + 300, x2: faceCenterX + 125, y2: faceCenterY + 175, x3: faceCenterX + 100, y3: faceCenterY + 175)
        // Inner
        strokeColor(gray: black)
        fillColor(red: 255/255, green: 182/255, blue: 193/255, alpha: 1)
        triangle(x1: faceCenterX - 155, y1: faceCenterY + 300, x2: faceCenterX - 125, y2: faceCenterY + 175, x3: faceCenterX - 210, y3: faceCenterY + 45)
        triangle(x1: faceCenterX + 155, y1: faceCenterY + 300, x2: faceCenterX + 125, y2: faceCenterY + 175, x3: faceCenterX + 210, y3: faceCenterY + 45)
        
        // Face fill
        strokeColor(gray: black)
        fillColor(gray: darkGrey)
        rect(x: faceCenterX - 175, y: faceCenterY - 190, width: 350, height: 275)
        rect(x: faceCenterX - 100, y: faceCenterY - 250, width: 200, height: 200)
        
        // Nose
        fillColor(gray: darkGrey)
        triangle(x1: faceCenterX, y1: faceCenterY - 250, x2: faceCenterX - 125, y2: faceCenterY + 175, x3: faceCenterX + 125, y3: faceCenterY + 175)
        fillColor(gray: lightGrey)
        triangle(x1: faceCenterX, y1: faceCenterY - 250, x2: faceCenterX - 100, y2: faceCenterY - 260, x3: faceCenterX - 120, y3: faceCenterY - 170)
        triangle(x1: faceCenterX, y1: faceCenterY - 250, x2: faceCenterX + 100, y2: faceCenterY - 260, x3: faceCenterX + 120, y3: faceCenterY - 170)
        fillColor(red: 255/255, green: 182/255, blue: 193/255, alpha: 1)
        strokeColor(gray: black)
        triangle(x1: faceCenterX, y1: faceCenterY - 250, x2: faceCenterX - 50, y2: faceCenterY - 175, x3: faceCenterX + 50, y3: faceCenterY - 175)
        
        // Forehead
        fillColor(gray: lightGrey)
        triangle(x1: faceCenterX, y1: faceCenterY + 100, x2: faceCenterX - 40, y2: faceCenterY + 175, x3: faceCenterX + 40, y3: faceCenterY + 175)
        
        // Cheeks
        fillColor(gray: darkGrey)
        strokeColor(gray: black)
        // L
        triangle(x1: faceCenterX - 190, y1: faceCenterY - 80, x2: faceCenterX - 210, y2: faceCenterY + 45, x3: faceCenterX - 150, y3: faceCenterY + 35)
        triangle(x1: faceCenterX - 190, y1: faceCenterY - 80, x2: faceCenterX - 256, y2: faceCenterY - 10, x3: faceCenterX - 210, y3: faceCenterY + 45)
        triangle(x1: faceCenterX - 175, y1: faceCenterY - 115, x2: faceCenterX - 235, y2: faceCenterY - 100, x3: faceCenterX - 175, y3: faceCenterY - 10)
        
        // R
        triangle(x1: faceCenterX + 190, y1: faceCenterY - 80, x2: faceCenterX + 210, y2: faceCenterY + 45, x3: faceCenterX + 150, y3: faceCenterY + 35)
        triangle(x1: faceCenterX + 190, y1: faceCenterY - 80, x2: faceCenterX + 256, y2: faceCenterY - 10, x3: faceCenterX + 210, y3: faceCenterY + 45)
         triangle(x1: faceCenterX + 175, y1: faceCenterY - 115, x2: faceCenterX + 235, y2: faceCenterY - 100, x3: faceCenterX + 175, y3: faceCenterY - 10)
        
        // Eyes that glow
        fillColor(gray: lightGrey)
        strokeColor(gray: black)
        //L eye
        triangle(x1: faceCenterX - 50, y1: faceCenterY + 20, x2: faceCenterX - 125, y2: faceCenterY + 175, x3: faceCenterX - 210, y3: faceCenterY + 45)
        triangle(x1: faceCenterX - 50, y1: faceCenterY + 20, x2: faceCenterX - 150, y2: faceCenterY + 36, x3: faceCenterX - 175, y3: faceCenterY - 10)
        //R eye
        triangle(x1: faceCenterX + 50, y1: faceCenterY + 20, x2: faceCenterX + 125, y2: faceCenterY + 175, x3: faceCenterX + 210, y3: faceCenterY + 45)
        triangle(x1: faceCenterX + 50, y1: faceCenterY + 20, x2: faceCenterX + 150, y2: faceCenterY + 36, x3: faceCenterX + 175, y3: faceCenterY - 10)
        
        //Glowing parts of eyes
        fillColor(red: (tin.mouseX/1600.0)+(tin.mouseY/1200.0), green: 0, blue: 0, alpha: 1)
        triangle(x1: faceCenterX - 50, y1: faceCenterY + 20, x2: faceCenterX - 130, y2: faceCenterY + 70, x3: faceCenterX - 150, y3: faceCenterY + 35)
        triangle(x1: faceCenterX + 50, y1: faceCenterY + 20, x2: faceCenterX + 130, y2: faceCenterY + 70, x3: faceCenterX + 150, y3: faceCenterY + 35)

        /*
 
         The stars goes here.
 
         */
        
        //Draw some stars and make 'em shimmer
        let starRadiusX  =  random(min: 150, max: 160)
        let starRadiusY  =  random(min: 150, max: 160)
        
        fillColor(red: 1, green: 1, blue: 0, alpha: random(min: 0.2, max: 1.0))
        strokeDisable()
        
        //Top R
        ellipse(centerX: faceCenterX+starRadiusX, centerY: faceCenterY+starRadiusY, width: random(min: 10, max: 20), height: random(min: 75, max: 90))
        ellipse(centerX: faceCenterX+starRadiusX, centerY: faceCenterY+starRadiusY, width: random(min: 75, max: 90), height: random(min: 10, max: 20))
        
        //Top L
        ellipse(centerX: faceCenterX-starRadiusX, centerY: faceCenterY+starRadiusY+50, width: random(min: 15, max: 20), height: random(min: 75, max: 90))
        ellipse(centerX: faceCenterX-starRadiusX, centerY: faceCenterY+starRadiusY+50, width: random(min: 75, max: 90), height: random(min: 15, max: 20))
        
        //Bottom R
        ellipse(centerX: faceCenterX+starRadiusX-30, centerY: faceCenterY-starRadiusY, width: random(min: 10, max: 20), height: random(min: 75, max: 90))
        ellipse(centerX: faceCenterX+starRadiusX-30, centerY: faceCenterY-starRadiusY, width: random(min: 75, max: 90), height: random(min: 10, max: 20))
        //Bottom L
        ellipse(centerX: faceCenterX-starRadiusX, centerY: faceCenterY-starRadiusY-50, width: random(min: 15, max: 20), height: random(min: 75, max: 90))
        ellipse(centerX: faceCenterX-starRadiusX, centerY: faceCenterY-starRadiusY-50
            , width: random(min: 75, max: 90), height: random(min: 15, max: 20))
        
        //Make the shooting star fly!
        ellipse(centerX: starX, centerY: starY, width: random(min: 20, max: 30), height: random(min: 80, max: 100))
        ellipse(centerX: starX, centerY: starY, width: random(min: 80, max: 100), height: random(min: 20, max: 30))
        starX = starX + starfallX
        starY = starY + starfallY
        
        
        
        
        // Your drawing code should be above this comment.
        // *************************************************
        
        //view?.stopUpdates()
    }
    
}

