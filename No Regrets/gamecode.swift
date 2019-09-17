//
//  gamecode.swift
//  No Regrets
//
//  Created by Bill Ni on 7/1/19.
//  Copyright © 2019 Bill Ni. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

var forwmove = false

class gameview: UIViewController {
    
    @IBOutlet weak var tapforw: UIButton!
    
    override func viewDidLoad() {
        let scene = GameScene(size: view.frame.size)
        let skv = view as! SKView
        skv.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        skv.presentScene(scene)
    }
    
    @IBAction func tapforw(_ sender: UIButton) {
        forwmove = true
    }
    
    @IBAction func notapforw(_ sender: UIButton) {
        forwmove = false
    }
    
}

class GameScene: SKScene {
    var stdstl = true
    
    let inactivePrimMdl = SKTexture(image: UIImage(named: "playermodel")!)
    let inactiveSecnMdl = SKTexture(image: UIImage(named: "breath1")!)
    let inactiveQuatMdl = SKTexture(image: UIImage(named: "breath3")!)
    var charMdl = SKSpriteNode(imageNamed: "playermodel")
    
    var stdact : Timer?
    
    override func didMove(to view: SKView){
        charMdl = SKSpriteNode(texture: inactivePrimMdl)
        charMdl.size = CGSize(width: 60, height: 90)
        charMdl.position = CGPoint(x: 200, y: view.bounds.height / 2)
        addChild(charMdl)
        
        let breathanim = SKAction.sequence([SKAction.animate(with: [inactiveSecnMdl], timePerFrame: 0.5), SKAction.animate(with: [inactivePrimMdl], timePerFrame: 0.2), SKAction.animate(with: [inactiveQuatMdl], timePerFrame: 0.5), SKAction.animate(with: [inactivePrimMdl], timePerFrame: 0.2)])
        
        stdact = Timer.scheduledTimer(withTimeInterval: 1.4, repeats: true) { timer in
            if(!forwmove){
                self.charMdl.run(breathanim)
            }else{
                self.charMdl.texture = self.inactivePrimMdl
            }
        }
    }
}
