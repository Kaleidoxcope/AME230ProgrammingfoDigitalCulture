//
//  ViewController.swift
//  Drawing
//
//

import Cocoa
import Tin


class ViewController: TController {

    var scene: Scene!
    
    // viewWillAppear will be called once, just before the view is placed on screen.
    //
    override func viewWillAppear() {
        view.window?.title = "Bounce Objects"
        makeView(width: 800.0, height: 600.0)
        scene = Scene()
        present(scene: scene)
        scene.view?.showStats = false
    }



    class Scene: TScene {
        var b1 = Ball()
        var b2 = Ball()
        var b3 = Ball()
        
        override func update() {
            background(gray: 0.5)
            
            b1.move()  //First
            b1.render()//Ball
            
            b2.move()  //Second
            b2.render()//Ball

            b3.move()  //Third
            b3.render()//Ball
        }
        
        
    }

}
