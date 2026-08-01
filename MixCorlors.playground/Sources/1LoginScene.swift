import Foundation
import SpriteKit

public class LoginScene: SKScene {

    // MARK: - Nodes

    private let header     = SKSpriteNode(imageNamed: "loginHeader")
    private let btnPlay    = SKSpriteNode(imageNamed: "loginPlay")
    private let btnCredits = SKSpriteNode(imageNamed: "loginPlay")
    private let background = SKSpriteNode(imageNamed: "loginPaintBoard")

    // MARK: - Dependencies

    /// Injected navigator; defaults to the shared singleton for production use.
    public var navigator: SceneNavigating = SceneNavigator.shared

    // MARK: - Scene Lifecycle

    override public func didMove(to view: SKView) {
        setupNodes()
    }

    // MARK: - Setup

    private func setupNodes() {
        guard let sceneWidth = scene?.size.width else { return }
        let verticalOffset = sceneWidth * 0.2

        configure(background, name: "Lousa",
                  size: CGSize(width: 500, height: 700),
                  position: .zero, zPosition: 0)

        configure(header, name: "Logo",
                  size: CGSize(width: 100, height: 100),
                  position: CGPoint(x: 0, y: verticalOffset), zPosition: 1)

        configure(btnPlay, name: "Play",
                  size: CGSize(width: 300, height: 100),
                  position: .zero, zPosition: 1)

        configure(btnCredits, name: "Credits",
                  size: CGSize(width: 300, height: 100),
                  position: CGPoint(x: 0, y: -verticalOffset), zPosition: 1)
    }

    private func configure(_ node: SKSpriteNode, name: String,
                           size: CGSize, position: CGPoint, zPosition: CGFloat) {
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.name       = name
        node.size       = size
        node.position   = position
        node.zPosition  = zPosition
        addChild(node)
    }

    // MARK: - Touch Handling

    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let point    = touch.location(in: self)
        let nodeName = scene?.nodes(at: point).first?.name

        switch nodeName {
        case btnPlay.name:
            navigator.navigateToPlay(from: self)
        case btnCredits.name:
            navigator.navigateToCredits(from: self)
        default:
            break
        }
    }
}
