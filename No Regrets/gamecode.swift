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
    let charMdl = SKSpriteNode(imageNamed: "playermodel")
    
    override func didMove(to view: SKView){
        charMdl.size = CGSize(width: 60, height: 90)
        charMdl.position = CGPoint(x: 200, y: view.bounds.height / 2)
        addChild(charMdl)
        
        let fw = UITapGestureRecognizer(target: CGRect(x: view.bounds.width / 2, y: 0, width: view.bounds.width / 2, height: view.bounds.height), action: #selector(tapright))
        view.addGestureRecognizer(fw)
    }
    
    @objc func tapright(fw: UITapGestureRecognizer){
        let rUPmotion = SKAction.move(to: CGPoint(x: charMdl.frame.minX, y: charMdl.frame.minY + 50), duration: 1)
        let rDNmotion = SKAction.move(to: CGPoint(x: charMdl.frame.minX, y: charMdl.frame.minY - 50), duration: 1)
        charMdl.run(rUPmotion)
        charMdl.run(rDNmotion)
    }
}
