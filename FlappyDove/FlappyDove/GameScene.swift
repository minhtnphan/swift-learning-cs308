//
//  GameScene.swift
//  FlappyDove
//
//  Created by Tuong-Minh Phan on 04/05/2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    //the GameScene's attributes are declared here
    var bird:SKSpriteNode!
    
    var breads:SKNode! //breadObject
    //Texture are for styling, which belongs to the node
    var breadUpTexture:SKTexture!
    var breadDownTexture:SKTexture!
    var breadRunning:SKAction! //animation
    
    var base = SKSpriteNode(imageNamed: "base.png")
    
    var background = SKSpriteNode(imageNamed: "flappy dove bg.jpeg")
    
    var score:SKLabelNode!
    var scoreCount:Int = 0
    
    //mask are created for collision detection
    let birdMask: UInt32 = 1 << 0
    let breadMask: UInt32 = 1 << 1
    let scoreMask: UInt32 = 1 << 2
    let groundMask:UInt32 = 1 << 4
    
    var restartGame = false
    
    override func didMove(to view: SKView) {
        //override function from UIResponder to initialize objects of game scene when the scene is called in main
        //initialize physics
        self.physicsWorld.contactDelegate = self
    
        //initialize background attributes
        background.position = CGPoint(x: 0, y: 0)
        background.size.width = self.size.width
        background.size.height = self.size.height
        background.zPosition = -10
        
        breads = SKNode()
        breads.zPosition = 1

        //create objects (nodes) and add them to the game scence
        makeBase()
        makeBird()
        makeScoreBoard()
        self.addChild(breads)
        self.addChild(base)
        self.addChild(background)
        self.addChild(bird)
        self.addChild(score)
        //make the floating breads
        runBread()
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //override function from UIResponder -- handling touching events
        //when there are touches -> add velocity to the bird
        if breads.speed > 0 {
            for _ in touches {
                bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bird.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 300))
            }
        }
        //else when bread's speed = 0, the first touch will restart the game
        if restartGame {
            self.resetGame()
        }
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //function to control game state of gaining score/losing
        //idea retrieved from FlappySwift
        //https://github.com/fullstackio/FlappySwift
        //detect if the bird gains a score: create a Score bitmask between the breads
        //the bird eventually will hit the score mask if it passes the breads
        if breads.speed > 0 {
            if (contact.bodyA.categoryBitMask & scoreMask) == scoreMask || ( contact.bodyB.categoryBitMask & scoreMask) == scoreMask {
                scoreCount += 1
                score.text = String(scoreCount)
            }
            //if the bird contacts with other masks (objects)
            else {
                breads.speed = 0
                bird.physicsBody?.collisionBitMask = breadMask | groundMask
                score.text = "you lose"
                self.restartGame = true
            }
        }
    }
    
    func makeBreads() {
        //function to initialize a pair of bread, including one upper bread and one lower bread
        let breadPair = SKNode()
        breadPair.position = CGPoint(x: self.frame.size.width + breadUpTexture.size().width, y: 0 )
        
        //for random placements of breads
        let randomHeight = Double(arc4random_uniform(UInt32(self.frame.height/4)) + UInt32(self.frame.height/4))
        
        //set attributes for the upper bread: position, physicsBody (for collision detection)
        let breadUp = SKSpriteNode(texture: breadUpTexture)
        breadUp.position = CGPoint(x: 0.0, y: randomHeight)
        
        breadUp.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: breadUp.size.width * 0.85, height: breadUp.size.height * 0.85))
        breadUp.physicsBody?.isDynamic = false
        breadUp.physicsBody?.allowsRotation = false
        breadUp.physicsBody?.categoryBitMask = breadMask
        breadUp.physicsBody?.contactTestBitMask = birdMask
        
        breadPair.addChild(breadUp)
        
        //set attributes for the lower bread: position, physicsBody (for collision detection)
        let breadDown = SKSpriteNode(texture: breadDownTexture)
        breadDown.position = CGPoint(x: 0.0, y: randomHeight - Double(breadDown.size.height) - 250.0)
        
        breadDown.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: breadDown.size.width * 0.85, height: breadDown.size.height * 0.85))
        breadDown.physicsBody?.isDynamic = false
        breadDown.physicsBody?.allowsRotation = false
        breadDown.physicsBody?.categoryBitMask = breadMask
        breadDown.physicsBody?.contactTestBitMask = birdMask
        
        breadPair.addChild(breadDown)
        
        //idea for scoreNode is retrieved from FlappySwift
        //https://github.com/fullstackio/FlappySwift
        //detect if the bird gains a score: create a Score bitmask between the breads
        //the bird eventually will hit the score mask if it passes the breads
        
        let scoreNode = SKNode()
        scoreNode.position = CGPoint(x: breadDown.size.width - bird.size.width / 2, y: self.frame.midY)
        scoreNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: self.frame.size.height))
        scoreNode.physicsBody?.isDynamic = false
        //set a mask for scoreNode so that it knows if any object collide with it
        scoreNode.physicsBody?.categoryBitMask = scoreMask
        //scoreNode must be able to contact the bird
        scoreNode.physicsBody?.contactTestBitMask = birdMask
        breadPair.addChild(scoreNode)
        
        breadPair.run(breadRunning)
        breads.addChild(breadPair)
        
    }
    
    func makeBreadSequence() {
        //function to create a breadPair motion
        breadUpTexture = SKTexture(imageNamed: "bread (1).png")
        breadDownTexture = SKTexture(imageNamed: "bread (1).png")
        
        //defining the distance that a pair can move
        let breadMovingDistance = CGFloat(self.frame.size.width * 2)
        //define an action attribute for pair of breads
        let moveBread = SKAction.moveBy(x: -breadMovingDistance, y: 0.0, duration: TimeInterval(0.01 * breadMovingDistance))
        //remove the breads from the scene when it finishes moving
        let removeBread = SKAction.removeFromParent()
        //turn the bread action into a loop
        breadRunning = SKAction.sequence([moveBread, removeBread])
    }
    
    func runBread() {
        //function to create a sequence of breadPair motion
        makeBreadSequence()
        //initialize the bread moving actions
        let runBreads = SKAction.run(makeBreads)
        //wait for 4 seconds until the next pair of breads appear
        let runBreadprocess = SKAction.sequence([runBreads, SKAction.wait(forDuration: 4.0)])
        //repeat the whole process
        let repeatRunBread = SKAction.repeatForever(runBreadprocess)
        //let the process appear in the game scene
        self.run(repeatRunBread)
    }
    
    func resetGame() {
        //function to reset the game
        if let view = self.view {
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFill
                scene.view?.showsFPS = true
                scene.view?.showsNodeCount = true
                
                scene.view?.ignoresSiblingOrder = true
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            }
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            view.showsPhysics = false
        }
        restartGame = false
    }
    
    func makeBird() {
        //function to create a bird
        //add values to the attribute of bird node: position, layer position, physics body
        let birdTexture1 = SKTexture(imageNamed: "trash dove (pixel).png")
        let birdTexture2 = SKTexture(imageNamed: "trash dove (pixel) (2).png")

        bird = SKSpriteNode(texture: birdTexture1)
        bird.setScale(0.05)
        bird.position = CGPoint(x: -200, y:5)
        bird.zPosition = 2
        bird.physicsBody = SKPhysicsBody(circleOfRadius: bird.size.height / 3.0)
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.allowsRotation = false
        bird.physicsBody?.categoryBitMask = birdMask
        //the bird can collide with the bread and the ground
        bird.physicsBody?.collisionBitMask = breadMask | groundMask
        //and there must be notification when they collide with each other
        bird.physicsBody?.contactTestBitMask = breadMask | groundMask
        
        //add moving animations for the bird
        let animate = SKAction.animate(with: [birdTexture1, birdTexture2], timePerFrame: 0.1)
        let headFlap = SKAction.repeatForever(animate)
        bird.run(headFlap)

    }
    
    func makeBase() {
        //function to create a base
        //add values to attribute of base node
        base.position = CGPoint(x: 0, y: -550)
        base.physicsBody = SKPhysicsBody(rectangleOf: base.size)
        base.physicsBody?.categoryBitMask = groundMask
        base.physicsBody?.isDynamic = false
        base.zPosition = 3
    }
    
    
    func makeScoreBoard() {
        //function to add values to attributes scoreboard node
        score = SKLabelNode(fontNamed: "Upheaval TT (BRK)")
        score.fontColor = SKColor.black
        score.fontSize = 100
        score.position = CGPoint(x: 0, y: 450)
        score.zPosition = 100
        score.text = "hello"
    }
    
    
}
