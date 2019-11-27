//
//  ViewController.swift

//

import Cocoa
import Tin


class ViewController: TController {

    var scene: Scene!
    
    override func viewWillAppear() {
        super.viewWillAppear()
        view.window?.title = "Parallax"
        makeView(width: 1000.0, height: 600.0)
        scene = Scene()
        present(scene: scene)
        scene.view?.showStats = false
    }

}


class Scene: TScene {
    //Image variables declared here to be used in the scene setup
    var waterfall: TImage! //Background waterfall image;
    var greenGrass: TImage! //Grass image with butterflies;
    var grassL: TImage! //Grass silhouette
    var grassR: TImage! //on right and left;
    var bushF: TImage! //Bushes are identified
    var bushM: TImage! //by position:
    var bushB: TImage! //Front, Middle, Back;
    var fairy: TImage! //Fairy sitting on a mushroom;
    var fbushB: TImage! //Flower bushes:
    var fbushF: TImage! //front and back;
    var vinesF: TImage! //Hanging vines:
    var vinesB: TImage! //front and back;
    var mushrooms: TImage! //Cluster of mushrooms;
    var treeF: TImage! //Detailed trees:
    var treeB: TImage! //front and back;
    var treeSilR: TImage! //Silhouetted tree:
    var treeSilL: TImage! //right and left
    
    
    override func setup() {
        //Load images during setup
        waterfall = TImage(contentsOfFileInBundle: "Waterfall.jpg")
        greenGrass = TImage(contentsOfFileInBundle: "green grass.png")
        grassL = TImage(contentsOfFileInBundle: "grass left.png")
        grassR = TImage(contentsOfFileInBundle: "grass right.png")
        bushF = TImage(contentsOfFileInBundle: "bush dark.png")
        bushM = TImage(contentsOfFileInBundle: "bush mid.png")
        bushB = TImage(contentsOfFileInBundle: "bush light.png")
        fairy = TImage(contentsOfFileInBundle: "fair sil1.png")
        fbushB = TImage(contentsOfFileInBundle: "flower-bushes.png")
        fbushF = TImage(contentsOfFileInBundle: "flower-bushes-sil.png")
        vinesB = TImage(contentsOfFileInBundle: "Hanging down vines.png")
        vinesF = TImage(contentsOfFileInBundle: "Hanging down vines sil.png")
        mushrooms = TImage(contentsOfFileInBundle: "mushroom cluster.png")
        treeB = TImage(contentsOfFileInBundle: "tree light.png")
        treeF = TImage(contentsOfFileInBundle: "tree dark.png")
        treeSilR = TImage(contentsOfFileInBundle: "tree sil.png")
        treeSilL = TImage(contentsOfFileInBundle: "tree sil copy.png")
    }
    
    
    override func update() {
        background(gray: 0.5)
        let my = -tin.mouseY // Using the -y position of the mouse to simulate moving toward the background
        
        
        // Draw the background waterfall image centered in the view.
        // x,y is the bottom, left corner of the image.
        let x = tin.midX - (waterfall.width / 2.0)
        let y = tin.midY - (waterfall.height / 2.0)
        
        if my <= 0.0 { //Controls the movement of the background
            image(image: waterfall, x: x, y: y + (my * 0.005))
        }
        else if my > 0.0 {
            image(image: waterfall, x: x, y: y)
        }

        
        // Images on the left of the view
        if my < 0.0 { //Keeps the objects on the left from moving too far into the view
            image(image: bushM, x: (my * 0.08) + 120, y: 100 + (my * 0.015))
            
            image(image: fbushB, x: (my * 0.09) - 40, y: 120 + (my * 0.02))
            
            image(image: greenGrass, x: (my * 0.1) + 30.0, y: 100.0 + (my * 0.025))
            
            image(image: treeF, x: (my * 0.2) - 200.0, y: 80.0 - (my * 0.02), width: 606.0, height: 450.0)
            
            image(image: vinesF, x: (my * 0.6), y: 240.0 - (my * 0.05), width: 700.0, height: 391.0)
            
            image(image: fbushF, x: (my * 0.6) - 300, y: -30 + (my * 0.03))
            
            image(image: treeSilL, x: (my * 0.7) - 600, y:  -(my * 0.05), width: 1108.0, height: 900)
        
            image(image: grassL, x: (my * 0.9), y: my * 0.05)
        
            image(image: mushrooms, x: (my * 0.9) - 30.0, y: -10 + (my * 0.06))
        }
        else if my >= 0.0 {
            image(image: bushM, x: 120, y: 100)
            
            image(image: fbushB, x: -40, y: 120)
            
            image(image: greenGrass, x: 30.0, y: 100.0)
            
            image(image: treeF, x: -200.0, y: 80.0, width: 606.0, height: 450.0)
            
            image(image: vinesF, x: 0, y: 240.0, width: 700.0, height: 391.0)
            
            image(image: fbushF, x: -300, y: -30)
            
            image(image: treeSilL, x: -600, y: 0, width: 1108.0, height: 900)
            
            image(image: grassL, x: 0, y: 0)
            
            image(image: mushrooms, x: -30.0, y: -10)
        }
        
        // Images on the right of the view
        if my < 0.0 { //Keeps the objects on the right from moving too far into the view
            image(image: bushB, x: 700.0 - (my * 0.2), y: 120.0 + (my * 0.025))
            
            image(image: fbushB, x: 570.0 - (my * 0.3), y: 80.0 + (my * 0.03))
            
            image(image: vinesB, x: tin.width - 400.0 - (my * 0.2), y: 400.0 - (my * 0.05), width: 400.0, height: 223.0)
            
            image(image: treeB, x: 600 - (my * 0.25), y: 100 + (my * 0.03), width: 471.0, height: 350.0)
            
            image(image: bushF, x: 800 - (my * 0.4), y: 30, width: 300.0, height: 269.0)
            
            image(image: fbushF, x: 600 - (my * 0.4), y: -20 + (my * 0.03))
            
            image(image: fairy, x: (tin.width - fairy.width - 50.0) - (my * 0.6), y: 20 + (my * 0.03))
            
            image(image: grassR, x: (tin.width - grassR.width) - (my * 0.8), y: my * 0.03)
            
            image(image: treeSilR, x: (tin.width - treeSilR.width/2) - 50.0 - (my * 0.9), y: -(my * 0.08))
        }
        else if my >= 0.0 {
            image(image: bushB, x: 700.0, y: 120.0)
            
            image(image: fbushB, x: 570.0, y: 80.0)
            
            image(image: vinesB, x: tin.width - 400.0, y: 400.0, width: 400.0, height: 223.0)
            
            image(image: treeB, x: 600, y: 100, width: 471.0, height: 350.0)
            
            image(image: bushF, x: 800, y: 30, width: 300.0, height: 269.0)
            
            image(image: fbushF, x: 600, y: -20)
            
            image(image: fairy, x: tin.width - fairy.width - 50.0, y: 20)
            
            image(image: grassR, x: (tin.width - grassR.width), y: 0)
            
            image(image: treeSilR, x: (tin.width - treeSilR.width/2) - 50.0, y: 0)
        }

    }
}

