import Foundation
import SpriteKit

public class LoginScene: SKScene {
    lazy var gameSceneCredits = GameSceneCredits(fileNamed: "GameScene")
    let header = SKSpriteNode(imageNamed: "loginHeader")
    let btnInit = SKSpriteNode(imageNamed: "loginPlay")
    let btnCredits = SKSpriteNode(imageNamed: "loginPlay")
    let background = SKSpriteNode(imageNamed: "loginPaintBoard")
    
    override public func didMove(to view: SKView) {
        createNode(node: header, name: "Logo", width: 100, height: 100, position: CGPoint(x: btnInit.position.x,
                                                                                                       y: (((scene?.size.width)!) - (scene?.size.width)! / 2) * 0.2), zPosition: 1)
        
        createNode(node: btnInit, name: "Play", width: 300, height: 100, position: .zero, zPosition: 1)
        print((scene?.size.width)! / 2)
        createNode(node: btnCredits, name: "Credits", width: 300, height: 100, position: CGPoint(x: btnInit.position.x,
                                                                                                 y: (((scene?.size.width)!) - (scene?.size.width)! / 2) * -0.2), zPosition: 1)
        
        createNode(node: background, name: "Lousa", width: 500, height: 700, position: .zero, zPosition: 0)
        
    }
    
    func present(nodeScene: GameSceneCredits){
        nodeScene.scaleMode = .aspectFit
        nodeScene.anchorPoint = .init(x: 0.5, y: 0.5)
        scene?.view?.presentScene(nodeScene)
    }
    
    func createNode(node: SKSpriteNode, name: String, width: Double, height: Double, position: CGPoint, zPosition: CGFloat){
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.name = name
        node.size = CGSize(width: width, height: height)
        node.position = position
        node.zPosition = zPosition
        addChild(node)
        
        
    }
    
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let p = touch.location(in: self)
            if let nodeClicked = scene?.nodes(at: p).first {
                print(nodeClicked.name ?? "")
                print(nodeClicked.position)
                if nodeClicked.name == btnInit.name{
                    if let scene = gameSceneCredits {
                        present(nodeScene: scene)
                    }
                    
                    
                }
            }
            
        }
    }
    
}
