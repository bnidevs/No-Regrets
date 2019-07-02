//
//  ViewController.swift
//  No Regrets
//
//  Created by Bill Ni on 6/29/19.
//  Copyright © 2019 Bill Ni. All rights reserved.
//

import UIKit

var level = -1
var music = true
var sfx = true

class genqlogo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        fadeViewInThenOut(view: view , delay: 3)
        _ = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { timer in
            self.performSegue(withIdentifier: "logotomenu", sender: nil)
        }
    }
    
    func fadeViewInThenOut(view : UIView, delay: TimeInterval) {
        let animationDuration = 1.0
        
        // Fade in the view
        UIView.animate(withDuration: animationDuration, animations: { () -> Void in
            view.alpha = 1
        }) { (Bool) -> Void in
            
            // After the animation completes, fade out the view after a delay
            
            UIView.animate(withDuration: animationDuration, delay: delay, options: [.curveEaseOut], animations: { () -> Void in
                view.alpha = 0
            }, completion: nil)
        }
    }
}

class blankintro: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        sleep(1)
        performSegue(withIdentifier: "introtologo", sender: nil)
    }
    
}

class optionscreen: UIViewController {
    
    @IBOutlet weak var tapmus: musbutton!
    @IBOutlet weak var tapsfx: sfxbutton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapmus(_ sender: musbutton) {
        sender.isSelected = !sender.isSelected
        music = !music
        
        sender.setBackgroundImage(UIImage(named: "musicbuttonon"), for: .normal)
        sender.setBackgroundImage(UIImage(named: "musicbuttonoff"), for: .selected)
    }
    
    @IBAction func tapsfx(_ sender: sfxbutton) {
        sender.isSelected = !sender.isSelected
        sfx = !sfx
        
        sender.setBackgroundImage(UIImage(named: "sfxbuttonon"), for: .normal)
        sender.setBackgroundImage(UIImage(named: "sfxbuttonoff"), for: .selected)
    }
}

class musbutton: UIButton {
    
}

class sfxbutton: UIButton {
    
}

class levelselect: UIViewController {
    
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    
    @IBOutlet weak var select: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func one(_ sender: UIButton) {
        self.select.tag = 1
        shiftSelect()
    }
    
    @IBAction func two(_ sender: UIButton) {
        self.select.tag = 2
        shiftSelect()
    }
    
    @IBAction func three(_ sender: UIButton) {
        self.select.tag = 3
        shiftSelect()
    }
    
    @IBAction func four(_ sender: UIButton) {
        self.select.tag = 4
        shiftSelect()
    }
    
    @IBAction func five(_ sender: UIButton) {
        self.select.tag = 5
        shiftSelect()
    }
    
    func shiftSelect(){
        let val = self.select.tag
        level = val
        
        if(val == 1){
            UIView.animate(withDuration: 0.5, animations: {
                self.select.center.x = 145
            });
        }else if(val == 2){
            UIView.animate(withDuration: 0.5, animations: {
                self.select.center.x = 145 + 94
            });
        }else if(val == 3){
            UIView.animate(withDuration: 0.5, animations: {
                self.select.center.x = 145 + 94 * 2
            });
        }else if(val == 4){
            UIView.animate(withDuration: 0.5, animations: {
                self.select.center.x = 145 + 94 * 3
            });
        }else{
            UIView.animate(withDuration: 0.5, animations: {
                self.select.center.x = 145 + 94 * 4
            });
        }
    }
}
