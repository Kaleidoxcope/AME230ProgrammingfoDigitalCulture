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



class Scene: TScene {
    
    var stars: [Star] = []
    override func setup() {
        for _ in 1...100 {
            let x = random(max: tin.width) //local variable
            let y = random(max: tin.height) //local variable
            let r = random(min: 10, max: 50) //local variable
            let s1 = Star(x: x, y: y, radius: r)
            stars.append(s1)
        }
    }
    
    override func update() {
        background(gray: 0.5)
        for star in stars {
            star.render()
            star.spin()
        }
        //view?.stopUpdates()
        }
    
    }
}


