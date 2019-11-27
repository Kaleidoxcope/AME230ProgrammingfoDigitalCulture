//
//  ViewController.swift
//  Tile Project
//
//

import Cocoa
import Tin


class ViewController: TController {
    
    //
    // viewWillAppear will be called once, just before the view is placed on screen.
    //
    override func viewWillAppear() {
        view.window?.title = "Tile"
        makeView(width: 900.0, height: 600.0)
        let scene = Scene()
        present(scene: scene)
        scene.view?.showStats = false
    }
    
}


class Scene: TScene {
    override func update() {
        background(gray: 1)
        var x = -25.0
        var y = -25.0
        let w = 50.0 //size of the tiles
        var count = 0

        while y < tin.height + 2*w {
        if count % 4 == 1 {
            tileBigCircle(x: x, y: y, width: w)
        }
        else if count % 2 == 0 {
            tileSmallCircle(x: x, y: y, width: w)
        }
        else if count % 4 == 3 {
            tileBigCircle2(x: x, y: y, width: w)
        }
            
        count += 1
        
        x += w
        if x >= tin.width + 2*w {
            x = -25.0 //once the entire row is filled horizontally y will increase and the loop will repeat
            y += w
        }
        
        
        view?.stopUpdates()
        }
    }
    
    
    func tileSmallCircle(x:Double, y: Double, width: Double){
        let w1 = width - 12
        strokeDisable()
        fillColor(gray: 0.5, alpha: 0.5)
        ellipse(centerX: x, centerY: y, width: w1, height: w1)
    }
    
    func tileBigCircle(x:Double, y: Double, width: Double){
        strokeColor(red: 0, green: 212/255, blue: 1, alpha: 1)
        fillColor(red: 0, green: 212/255, blue: 1, alpha: 0.2)
        let w1 = width * 2.8
        ellipse(centerX: x, centerY: y, width: w1, height: w1)
    }
    func tileBigCircle2(x:Double, y: Double, width: Double){
        strokeColor(red: 1, green: 0, blue: 212/255, alpha: 1)
        fillColor(red: 1, green: 0, blue: 212/255, alpha: 0.2)
        let w1 = width * 2.8
        ellipse(centerX: x, centerY: y, width: w1, height: w1)
    }
}

