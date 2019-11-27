//
//  ViewController.swift
//  FourShapes
//
//

import Cocoa
import Tin


class ViewController: TController {

    var scene: Scene!
    
    //
    // viewWillAppear will be called once, just before the view is placed on screen.
    //
    override func viewWillAppear() {
        view.window?.title = "Four Shapes"
        makeView(width: 800.0, height: 400.0)
        scene = Scene()
        present(scene: scene)
        scene.view?.showStats = false
    }

}


class Scene: TScene {
    // Variables that are declared here, inside the Scene class
    // will remember their values for the entire run of the program.
    
    //Shape settings
    let side = 100.0
    let centerX = 400.0
    let centerY = 200.0
    let space = 20.0
    
    //Color settings
    let on = 1.0
    let off = 0.0
    let black = 0.0
    let white = 1.0
    
    //Dynamic variables
    var lightA = false
    var lightB = false
    var lightC = false
    
    
    //
    // The update function is called to draw the view automatically.
    //
    override func update() {
        // background erases the view and sets the entire view to one flat
        // color. If you want a different background color, change it here.
        background(gray: 0.5)
        
        // Remember:
        // Variables declared here, inside the update function,
        // only remember values for one call to the update function.
        
        // *************************************************
        // Insert your drawing code here, below this comment
        
        strokeColor(gray: black)
        
        //Shape A
        if  tin.mouseX > (centerX - (2*side) - ((3*space)/2)) && tin.mouseX < ((centerX - side - (3*space)/2)) &&
            tin.mouseY > centerY - (side/2) && tin.mouseY < centerY + (side/2) {
                //Shape A lights up
                lightA = true
        }
        
        //Shape B
        if  tin.mouseX > centerX - side - (space/2) && tin.mouseX < centerX - (space/2) &&
            tin.mouseY > centerY - (side/2) && tin.mouseY < centerY + (side/2) &&
            lightA == true{
            //Shape B lights up
            lightB = true
        }
        
        //Shape C
        if  tin.mouseX > centerX + (space/2) && tin.mouseX < centerX + (space/2) + side &&
            tin.mouseY > centerY - (side/2) && tin.mouseY < centerY + (side/2) &&
            lightA == true && lightB == true{
            //Shape C lights up
            lightC = true
        }
        
        //Shape D
        if tin.mouseX > centerX + (side + (3*space)/2) && tin.mouseX < centerX + (side + (3*space)/2) + side &&
            tin.mouseY > centerY - (side/2) && tin.mouseY < centerY + (side/2) {
            //Shape D clears all previous settings
            lightA = false
            lightB = false
            lightC = false
        }
        
        // *************************************************
        
        //Draw the shapes
        
        //A
        if  lightA == true {
            fillColor(red: on, green: off, blue: off, alpha: 1)
        }
        else if lightA == false {
            fillColor(gray: white)
        }
        rect(x: (centerX - (2*side) - ((3*space)/2)), y: centerY - (side/2), width: side, height: side)
        
        
        //B
        if  lightB == true && lightA == true {
            fillColor(red: off, green: on, blue: off, alpha: 1)
        }
        else if lightA == false || lightB == false {
            fillColor(gray: white)
        }
        rect(x: centerX - side - (space/2), y: centerY - (side/2), width: side, height: side)
        
        //C
        if  lightC == true && lightB == true && lightA == true {
            fillColor(red: off, green: off, blue: on, alpha: 1)
        }
        else if lightA == false || lightB == false || lightC == false {
            fillColor(gray: white)
        }
        rect(x: centerX + (space/2), y: centerY - (side/2), width: side, height: side)
        
        //D
        if lightA == true || lightB == true || lightC == true {
            fillColor(gray: white)
        }
        rect(x: (centerX + (side + (3*space)/2)), y: centerY - (side/2), width: side, height: side)
        
        
        
    }
    
}


