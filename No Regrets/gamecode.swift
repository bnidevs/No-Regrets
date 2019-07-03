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

class gameview: UIViewController {
    
    override func viewDidLoad() {
        let scene = GameScene(size: view.frame.size)
        let skv = view as! SKView
        skv.presentScene(scene)
    }
}

class GameScene: SKScene {
    let inactivePrimMdl = SKTexture(image: UIImage(named: "playermodel")!)
    let inactiveSecnMdl = SKTexture(image: UIImage(named: "breath1")!)
    let inactiveQuatMdl = SKTexture(image: UIImage(named: "breath3")!)
    var charMdl = SKSpriteNode(imageNamed: "playermodel")
    
    override func didMove(to view: SKView){
        charMdl = SKSpriteNode(texture: inactivePrimMdl)
        charMdl.size = CGSize(width: 60, height: 90)
        charMdl.position = CGPoint(x: 200, y: view.bounds.height / 2)
        addChild(charMdl)
        
        let breathanim = SKAction.sequence([SKAction.animate(with: [inactiveSecnMdl], timePerFrame: 0.4), SKAction.animate(with: [inactiveQuatMdl], timePerFrame: 0.4), SKAction.animate(with: [inactivePrimMdl], timePerFrame: 0.4)])
        charMdl.run(SKAction.repeatForever(breathanim))
        
        let fw = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(fw)
    }
    
    @objc func tap(fw: UITapGestureRecognizer){
        
    }
}
