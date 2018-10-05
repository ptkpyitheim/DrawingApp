//
//  ViewController.swift
//  PyiKyaw-Lab3
//
//  Created by Pyi Theim Kyaw on 10/3/18.
//  Copyright © 2018 Pyi Theim Kyaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Current color of the drawing dot
    var currColor: UIColor = UIColor.blue
    
    //Outlets
    @IBOutlet weak var drawView: DotView!
    @IBOutlet weak var slider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Animates welcome message. Function defined below.
        showAnimation()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("you touched this view")
        
        let lineThickness = CGFloat(2 + slider.value * 20)

        let touchPt = (touches.first)!.location(in: drawView) as CGPoint
        
        drawView.theDot = Dot(points: [], thickness: lineThickness, color: currColor)
        drawView.theDot?.points.append(touchPt)
        drawView.dots.append(drawView.theDot!)
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPt = (touches.first)!.location(in: drawView) as CGPoint
        
        print("You moved to \(touchPt)")
        
        drawView.theDot?.points.append(touchPt)
        
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("You stopped touching")
        
        let touchPt = (touches.first)!.location(in: drawView) as CGPoint
        
        print("You moved to \(touchPt)")
        
        drawView.theDot?.points.append(touchPt)
        drawView.dots.append(drawView.theDot!)
    }
    
    
    
    //Clears the entire screen
    @IBAction func clearBtn(_ sender: Any) {
        if(drawView.dots.isEmpty) {
            print("Nothing to clear")
        }
        else {
            drawView.dots = []
            drawView.theDot = nil
        }
    }
    
    
    
    //Undo the last line drawn
    @IBAction func undoBtn(_ sender: Any) {
        if(!drawView.dots.isEmpty) {
            drawView.theDot = nil
            drawView.dots.removeLast()
        }
        else {
            print("No more lines to undo")
        }
    }
    
    
    
    //***** Creative portion below *****
    
    
    //Stack View for drop down
    @IBAction func colorBtn(_ sender: Any) {
        colorSelector.forEach { (button) in
            UIView.animate(withDuration: 0.4, animations: {
                 button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    //Collection of buttons
    @IBOutlet var colorSelector: [UIButton]!
    
    
    //Colored buttons below...
    @IBAction func blackBtn(_ sender: Any) {
        currColor = UIColor.black
        print("Black is pressed")
    }
    
    @IBAction func blueBtn(_ sender: Any) {
        currColor = UIColor.blue
        print("Blue is pressed")
    }
    
    @IBAction func purpleBtn(_ sender: Any) {
        currColor = UIColor.purple
        print("Purple is pressed")
    }
    
    @IBAction func cyanBtn(_ sender: Any) {
        currColor = UIColor.cyan
        print("Cyan is pressed")
    }
    
    @IBAction func greenBtn(_ sender: Any) {
        currColor = UIColor.green
        print("Green is pressed")
    }
    
    @IBAction func magentaBtn(_ sender: Any) {
        currColor = UIColor.magenta
        print("Magenta is pressed")
    }
    
    @IBAction func orangeBtn(_ sender: Any) {
        currColor = UIColor.orange
        print("Orange is pressed")
    }
    
    @IBAction func redBtn(_ sender: Any) {
        currColor = UIColor.red
        print("Red is pressed")
    }

    
    
    //Animating welcome message. showAnimation() called in ViewDidLoad
    @IBOutlet weak var WelcomeImage: UIImageView!
    
    func showAnimation() {
        UIView.animate(withDuration: 4, animations: {
            self.WelcomeImage.frame = CGRect(x: 20, y: 200, width: 300, height: 120)
            })
        {
            (finishes) in
            self.WelcomeImage.isHidden = true
        }
    }

}



