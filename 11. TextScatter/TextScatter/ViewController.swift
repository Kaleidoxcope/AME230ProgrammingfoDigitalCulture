//
//  ViewController.swift

//

import Cocoa
import Tin


class ViewController: TController {

    var scene: Scene!
    
    override func viewWillAppear() {
        super.viewWillAppear()
        view.window?.title = "Text Scatter"
        makeView(width: 1200.0, height: 800.0)
        scene = Scene()
        present(scene: scene)
        scene.view?.showStats = false
    }
    
    
    // Press any key, and toggle is called.
    // It will either start time animating if it is stopped.
    // Or, it will stop it, if it is already animating.
    override func keyDown(with event: NSEvent) {
        scene.toggle()
    }

}


class Scene: TScene {
    // Scene properties
    var time = 1.0              // A variable that animates between 0 and 1.
    var inc = -1.0 / 120.0      // Amount to increment time each update.
    var isAnimating = false     // Indicates whether time is changing.
    var font = TFont(fontName: "Helvetica Neue Condensed Black", ofSize: 70.0)
    
    // Create an empty array to be filles with the string value of our message
    var letters: [Letter] = []
    
    // Set the message
    let message = "Thank you for everything this semester!"
    
    override func setup() {
        // One time setup here.
        let messageSize = font.size(ofMessage: message)
        let messageWidth = Double(messageSize.width)
        
        // Calculate x and y to center to text in the view.
        // x needs to be offset to the left by half the messageWidth
        // in order for the entire string to be centered.
        var x = tin.midX - (messageWidth / 2.0 )
        let y = tin.midY
        
        // Draw each character individually.
        for c in message {
            // Need to know the width of this letter.
            let letterSize = font.size(ofMessage: "\(c)")
            let letterWidth = Double(letterSize.width)
            
            // We want a position that is where the center of the
            // letter will be.
            let xc = (letterWidth / 2.0) + x
            
            let l = Letter(letter: "\(c)", homeX: xc, homeY: y) // Fill the array with the letter values
            letters.append(l)                                   // from our message, one after the oher
            
            // increment x by the width of this letter.
            x += letterWidth
            
        }
    }
    
    
    override func update() {
        background(gray: 0.5)
        
        
        for aLetter in letters {                // Call the render
            aLetter.render(t: time, font: font) // function in a loop
        }
        
        
        if isAnimating {                // Set the properties
            time += inc                 // for the animation
            if time <= 0.0 {            // when isAnimating
                time = 0.0              // value is true
                inc = inc * -1.0
                isAnimating = false
            }
            else if time >= 1.0 {
                time = 1.0
                inc = inc * -1.0
                isAnimating = false
            }
            print("time is \(time)")
        }
        
    }
    
    
    // This flips the value of isAnimating.
    //    if isAnimating is true, it changes to false
    //    if isAnimating is false, it changes to true
    func toggle() {
        isAnimating = !isAnimating
    }
    
    
}

