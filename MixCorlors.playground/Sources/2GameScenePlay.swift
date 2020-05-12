import Foundation
import SpriteKit

public class GameScenePlay: SKScene{
   // lazy var scene2 = GameScene(fileNamed: "GameScene")

    override public func didMove(to view: SKView) {
        print("entrei na tela")

  
    }

       
       
       public func touchDown(atPoint pos : CGPoint) {
    
       }
       
       public func touchMoved(toPoint pos : CGPoint) {

       }
       
       public func touchUp(atPoint pos : CGPoint) {

       }
       
       override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         if let touch = touches.first {
                    let p = touch.location(in: self)
                    let nodeClickado = scene?.nodes(at: p).first ?? SKNode()
        }
                    
       }
       
       override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
          
       }
       
       override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
           
       }
       
       override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
         
       }
       
       override public func update(_ currentTime: TimeInterval) {
           // Called before each frame is rendered
       }
  
}
