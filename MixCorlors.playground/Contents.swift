//:   AQUI VOU DESCREVER O FUNCIONAMENTO DO PROJETO

import PlaygroundSupport
import SpriteKit





//let sceneView = SKView(frame: UIScreen.main.bounds)
let sceneView = SKView(frame: CGRect(x:0, y:0, width: 1024, height: 768))
if let scene = LoginScene(fileNamed: "GameScene") {
    
    scene.scaleMode = .aspectFit
    scene.anchorPoint = .init(x: 0.5, y: 0.5)
    
    sceneView.showsFPS = true
    sceneView.showsNodeCount = true
    sceneView.showsFields = true
    print(scene.anchorPoint)
    scene.backgroundColor = .systemGray6
    sceneView.presentScene(scene)
    
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

