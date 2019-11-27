//
//  ViewController.swift
//  


import Cocoa
import Tin

class ViewController: TController {

    var scene: Scene!
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        view.window?.title = "The Hatch"
        makeView(width: 1000.0, height: 600.0)
        scene = Scene()
        present(scene: scene)
        scene.view?.showStats = false
    }
    
    
    override func mouseUp(with event: NSEvent) {
        scene.checkForButtonPress()
    }
    
}




class Scene: TScene {
    // scene properties here
    var box = Box()
    var button = CircleButton(x: 800, y: 300, radius: 30)
    
    
    override func update() {
        background(gray: 0.5)
        
        // FIX 1. ADD CODE HERE ****************************************
        // What is needed here:
        //    a. Update the box lid position. By update, what I mean is that
        //       somewhere there is a variable that keeps track of a value for
        //       how much the lid is rotated. For the lid to rotate, that value
        //       will need to change.
        box.update()
        
        //    b. Render the box
        box.render()
        
        //    c. If the box is opening, or closing, update the button.
        if box.state == .opening {
            button.updateOpening()
        }
        else if box.state == .closing {
            button.updateClosing()
        }
        
        //    d. Render the button
        button.render()
        
        
    }
    
    
    // In this function, check to see if the mouse position is inside
    // the button, if it is, advance the box to its next lid state.
    func checkForButtonPress() {
        
        // FIX 4. ADD CODE HERE ****************************************
        // What is needed here:
        //     a. Test to see if the mouse position is inside the button.
        if button.isPointInside(positionX: tin.mouseX, positionY: tin.mouseY) == true {
        //     b. if it is, change the box lid to its next lid state.
            box.nextState()
        }
    }
    
    
}

